# Evolution Core Engine
# Author: Sky(Hao) Yin
# � 2005-2006. All Rights Reserved

class EvolutionController < ApplicationController
  before_filter :authorize
  layout "evolution"

  def initialize
    super
    # this query will take a long time!
    @period_list = Quote.find(:all, :order => 'date', 
                              :select => 'distinct date').map {|x| x.date}

    # Default rate 1%, more complicated rule to be developed in future
    @txn_rate = 0.005
    @max_memory = Pm.maximum :memory
  end

  # Iterate on pm for more personalities ...
  def train_pms
    profiles = User.find(session[:user_id]).profiles
    @stock_list = profiles.map {|x| x.ticker}
    
		# Adjusted half year T-bill rate TODO: get from historical rfr table
    quote_types = profiles.map{|x| x.quote_type}.uniq
    if quote_types.size == 1 # Check if quote type is unified
      case quote_types[0] 
        when 'Weekly' : @rfr = 0.0413 / 50
        when 'Daily'  : @rfr = 0.0413 / 360
      end
    end
    
    Pm.find_all.each do |pm| # No assumption on PMs' order
      if pm.status == 'Waiting'
        # Slice periods according to pm's memory (at least 2)
        (0..(@period_list.size - pm.memory)).step(pm.confidence) do |from| # Tricky!
          to = from + pm.memory - 1 # Tricky!
          current_period = @period_list[from..to] # Ruby style of list slicing
          
          # Tricky! The last several days that exceed the range will be non-existed
					# Therefore, the length of confidence_period can be less than PM confidence
          confidence_period = @period_list[(to + 1)..(to + pm.confidence)]
          optimize(pm, current_period, confidence_period)
        end
        pm.status = 'Calculated'
        pm.save
      end
      # Skip the calculated Pm
    end
    flash[:notice] = "The evolution of portfolio managers has finished."
    redirect_to :controller => 'report', :action => 'pm_performance'
  end

  # Iterate on investors for more personalities ...
  def train_investors
    # If not all PMs have been trained
    pm_status = Pm.find_all.map{|x| x.status}.uniq
    if Pmp.count == 0 or pm_status.size != 1
      flash[:notice] = "Please train PMs first."
      redirect_to :controller => 'pms_admin'
    else  
      Investor.find_all.each do |investor|
        if investor.status == 'Waiting'
          # Tricky! leave last one day to check predicted performance
          (@max_memory..(@period_list.size - 1 - investor.memory)).each do |from|
            to = from + investor.memory - 1
            evaluate_ip(from, to, investor)
          end # Next tracing period
          investor.status = 'Calculated'
          investor.save
        end
        # Skip calculated investor
      end # Next investor
  
      flash[:notice] = "The selection of portfolio managers for investors has finished."
      redirect_to :controller => 'report', :action => 'investor_performance'
    end
  end

private # Internal functions followed

  # Optimize on given stocks for a certain pm during a given period
  def optimize(pm, current_period, confidence_period)
    # If previous Pm has already optimized for the same period
    pm_done = Pm.find_by_memory_and_status(pm.memory, 'Calculated')
    unless pm_done.nil?
      pm_done.pis.find_all_by_date(current_period.last.to_s).each do |pi|
        new_pi = Pi.new
        new_pi.ticker = pi.ticker
        new_pi.date = pi.date
        new_pi.fraction = pi.fraction
        pm.pis << new_pi
      end
    else
      prepare_data(current_period)
			update_model(current_period.size, @rfr * pm.memory)
			execute_optimizer
      analyze_result(pm, current_period.last)
    end

    # This can also be optimized for the redundancy...TBD
    evaluate_pmp(pm, current_period.last, confidence_period)
  end

  # Preprare the data set for the optimizer, given a certain range of date
  def prepare_data(current_period)
    periods = current_period.size
    date_from = current_period.first
    date_to = current_period.last

    # Select stocks later
    # TODO: select user-specific quotes
    quotes = Quote.find(:all, :conditions => "date >= '#{date_from}'
                            and date <= '#{date_to}'", :order => "date, ticker")

    # Heading
    @data = "set A := "
    (1..@stock_list.size).to_a.each {|i| @data << i.to_s + " "}
    @data << ";\n" + "param H : "
    (1..@stock_list.size).to_a.each {|i| @data << i.to_s + " "}
    @data << " := \n"

    # Body of data to feed optimizer
    for period in (1..periods)
      @data << period.to_s + " "
      for i in (0..(@stock_list.size)-1)
        @data << (quotes[(period - 1) *
          (@stock_list.size) + i].rate_of_return + 1).to_s + " "
      end
      @data << "\n"
    end

    # The end
    @data << ";\n"
  end

  # Update the optimization model file
  def update_model(periods, rfr)
    # Sortino Ratio-powered Portfolio Optimization Model
    # Reference: AMPL examples by Robert Vanderbei from Princeton
    #            OPIM 913 lecture notes from Wharton
    #            www.ampl.com
    @model = ""
    @model << "option solver " + '".\ampl\minos"' + "; \n"
    @model << "option minos_options 'Hessian_dimension= #{@max_memory}'; \n"
    @model << "set A;  \n" # Set of equities
    @model << "set T := {1.." + periods.to_s + "}; \n" # Set of periods
    @model << "param RFR > 0 default " + rfr.to_s +  ";\n" # Risk-free rate
    @model << "param H{T,A}; \n"  # Historical data matrix
    @model << "param AMean{j in A} := (sum{i in T} H[i,j]) / card(T); \n" # Arithmetic
    @model << "param GMean{j in A} := (product{i in T} H[i,j])^(1 / card{T});  \n" # Geometric
    @model << "param Rtilde{i in T, j in A} := H[i,j] - AMean[j];\n" # Absolute
    @model << "var x{A} >=0, := 1/card{A}; \n" # Fraction
    @model << "maximize Sortino_ratio: \n"
    @model << "    ((sum{j in A} GMean[j] * x[j]) - (RFR + 1))  / \n"
    @model << "    (sqrt(sum{i in T} (sum{j in A: Rtilde[i,j] < 0} \n" # Downside SD
    @model << "    Rtilde[i,j] * x[j])^2 / card{T})); \n"
    @model << "subject to Weights_summary: sum{j in A} x[j] = 1; \n" # Constraint
    #@model << "subject to Weight_ceiling {i in A}: x[i] <= .20; \n" # Constraint
    @model << "data;\n" + @data
    @model << "solve; \n"
    @model << "printf {j in A}: \"%21s      \t%5.7f \\n\", j, x[j] * 100;\n"
  end

  # Optimize
  def execute_optimizer
    # Current path issue here
    @result = ""
    io = IO.popen("./ampl/ampl.exe", "r+") do |io|
      io.puts @model # $stdin pipe
      io.close_write # Close the writing way of pipe
      @result = io.read
    end
  end

  # Retrieve the result of optimization and fill into a portfolio
  def analyze_result(pm, last_day)
    lc = 1 # Initialize the line counter
    @result.each_line do |line|
      # Warning if the optimizer works out of the limitation: 300 variables
      if lc == 2 and line =~ /sorry/
        logger.error 'Optimization is overflow!'
        flash[:notice] = "Optimization is overflow!"
        return
      end

      # Analyze the optimized fraction of members
      if lc >= 5 and lc <= (4 + @stock_list.size)
        temp = line.split("\t") # Omit temp[0]
        fraction = temp[1].to_f
        if fraction > 0.001 # Discard fractions which are less than 0.001%
          pi = Pi.new # New portfolio item
          pi.ticker = @stock_list[lc - 5]
          pi.date = last_day
          pi.fraction = fraction
          pm.pis << pi # Save PI to database
        end
      end
      lc += 1 # Increase the counter
    end # Next line
  end

  # Evaluate PM performance
  def evaluate_pmp(pm, last_day, confidence_period)
    for i in (1..confidence_period.size)
      pmp = Pmp.new # New portfolio manager performance
      pmp.optimized_date = last_day # Last day of optimized period
      pmp.actualized_date = confidence_period[i - 1] # From the first day
      p1, p2 = {}, {} # Temp harsh for evaluating txn cost

			# Weighted actualized return (already initialized to 0 in database)
      pmp.actualized_return = Pmp.actualized_return(pmp, last_day, pm)

      # The txn_cost only occurs everytime the portfolio is revised
      # Opening trade also involves txn_cost (when p2 is null)
      if i == 1
        previous_last_day = @period_list.index(last_day) - pm.confidence
        pm.pis.find_all_by_date(@period_list[previous_last_day]).each do |pi|
          p2[pi.ticker] = pi.fraction
        end
        # Current portfolio structure
        pm.pis.find_all_by_date(last_day).each {|pi| p1[pi.ticker] = pi.fraction}
        pmp.after_cost_return = pmp.actualized_return - evaluate_txn_cost(p1,p2)
      else
        pmp.after_cost_return = pmp.actualized_return # No txn_cost
      end

      pm.pmps << pmp # Save PMP to database
    end # Next date in confidence period
  end

  # Evaluate the transacton cost occurred from a revision
  def evaluate_txn_cost(portfolio1, portfolio2)
    # Simple theme:
    # p1 = {'a' => 40, 'b' => 60}
    # p2 = {'a' => 60, 'c' => 40}
    # therefore, txn_cost(p1, p2) = rate * (20 + 40 + 60)
    cost = 0

    same_stocks = portfolio1.keys & portfolio2.keys # Union
    p1_left = portfolio1.keys - same_stocks
    p2_left = portfolio2.keys - same_stocks

    same_stocks.each {|stock|
      cost += @txn_rate * (portfolio1[stock] - portfolio2[stock]).abs}
    p1_left.each {|stock| cost += @txn_rate * portfolio1[stock]}
    p2_left.each {|stock| cost += @txn_rate * portfolio2[stock]}
    cost
  end

	# Evaluate Investor performance
	def evaluate_ip(from, to, investor)
		# Start|end of tracing period
		ps, pe = @period_list[from], @period_list[to]
		p1, p2 = {}, {} # Temporal hashes to calculate txn_cost

		ip = Ip.new # New investor performance
		ip.date = @period_list[to + 1] # Actualized date

		if from == @max_memory # Guarentee to select a PM at the first round
			ip.pm = Pm.find(Pmp.best_pm(ps, pe))
		else
			current_pm = investor.ips.find_by_date(pe).pm
			last_pmp = current_pm.pmps.find_by_actualized_date(pe)
			# Day when optimizated
			optimized_start = @period_list.index(last_pmp.optimized_date)
			# Periods left within confidence period
			periods_left = optimized_start - to + current_pm.confidence
			if periods_left == 0 # When PM confidence period is over
				ip.pm = Pm.find(Pmp.best_pm(ps, pe))
			else
				ip.pm = current_pm # Stay with the original PM
			end
		end

		# Actualized return based on selected PM's portfolio in the next period
		pmp = ip.pm.pmps.find_by_actualized_date(ip.date)
		# Actualized return of chosen pm
		ip.actualized_return = pmp.actualized_return

		if from == @max_memory
			# Txn cost of opening trade
			ip.after_cost_return = pmp.after_cost_return - 1 # Default txn cost rate 1%
		elsif periods_left == 0 # When PM confidence period is over
			# SWitching cost between two PMs:

			# Original portfolio structure
			current_pm.pis.find_all_by_date(@period_list[to]).each do |pi|
				p2[pi.ticker] = pi.fraction
			end
			# New portfolio structure
			ip.pm.pis.find_all_by_date(ip.date).each {|pi| p1[pi.ticker] = pi.fraction}
			# If keep sticking to current PM, txn_cost will be zero
			ip.after_cost_return = pmp.actualized_return - evaluate_txn_cost(p1,p2)
		else
			# No txn cost for sticking period
			ip.after_cost_return = pmp.actualized_return
		end

		investor.ips << ip # Save IP to database
	end

end # End of core
