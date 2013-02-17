# Evolution Reporting
# Author: Sky(Hao) Yin
# � 2005-2006. All Rights Reserved

class ReportController < ApplicationController
	layout "evolution"
	before_filter :authorize

	def initialize
		super
    @period_list = Quote.find(:all, :order => 'date', 
                              :select => 'distinct date').map {|x| x.date}
		@max_memory = Pm.maximum :memory
	end

	# PM performance during the whole benchmark period is for internal usage only
	def pm_performance
    if Pmp.count == 0
			flash[:notice] = "Portfolio managers haven't been trained."
			return
    end
    		
    # Adjusted half year T-bill rate TODO: get from historical rfr table
    quote_types = User.find(session[:user_id]).profiles.map{|x| x.quote_type}.uniq
    if quote_types.size == 1 # Check if quote type is unified
      case quote_types[0] 
        when 'Weekly' : @rfr = 0.0413 / 50
        when 'Daily'  : @rfr = 0.0413 / 360
      end
    end # TODO: else warning?
	
    @pmp = {}
		Pmp.performance(@rfr).each do |pmp|
			# Annualize the ror and risk-adjusted ror
			pm = Pm.find(pmp.pm_id)
			case quote_types[0] 
				when 'Weekly'
					@pmp[pm] =
						{'ror' => (pmp.ror.to_f ** (1.0 / @period_list.size)) ** 50,
						 'sortino' => pmp.sortino.to_f}
				when 'Daily'
					@stock[pmp] =
						{'ror' => (pmp.ror.to_f ** (1.0 / @period_list.size)) ** 360,
						 'sortino' => pmp.sortino.to_f}
			end
    end

		#above_average = @pmp.keys.map{|x| x if (@pmp[x] * 100 - 100) >= @stock_average}.compact
		@pages, @pmps = paginate_collection @pmp.keys, :page => params[:page]
	end

	# Final Snapshot of investor performance
  def investor_performance
    if Ip.count == 0
			flash[:notice] = "Investors haven't been trained."
			return
		end
    
    quote_types = User.find(session[:user_id]).profiles.map{|x| x.quote_type}.uniq
    if quote_types.size == 1 # Check if quote type is unified
      case quote_types[0] 
        when 'Weekly' : @rfr = 0.0413 / 50
        when 'Daily'  : @rfr = 0.0413 / 360
      end
    end

    @ip = {}
		Ip.performance(@rfr).each do |ip|
			# Annualize the ror and risk-adjusted ror
			investor = Investor.find(ip.investor_id)

			case quote_types[0] 
				when 'Weekly'
					@ip[investor] =
						{'ror' => (ip.ror.to_f ** (1.0 / investor.ips.count)) ** 50,
						 'sortino' => ip.sortino.to_f}
				when 'Daily'
					@stock[pmp] =
						{'ror' => (ip.ror.to_f ** (1.0 / investor.ips.count)) ** 360,
						 'sortino' => ip.sortino.to_f}
			end
    end

		#above_average = @ip.keys.map{|x| x if (@ip[x] * 100 - 100) >= @stock_average}.compact
		@pages, @ips = paginate_collection @ip.keys, :page => params[:page]
	end

  def stock_performance
    profiles = User.find(session[:user_id]).profiles

    if profiles.count == 0
			flash[:notice] = "Portfolio hasn't been established."
			return
    end
    		
    quote_types = profiles.map{|x| x.quote_type}.uniq
    if quote_types.size == 1 # Check if quote type is unified
      case quote_types[0] 
        when 'Weekly' : @rfr = 0.0413 / 50
        when 'Daily'  : @rfr = 0.0413 / 360
      end
    end
  
		@stock = {} # Non-order hash
		Quote.performance(@rfr).each do |quote|
			# Annualize the ror and risk-adjusted ror
			case quote_types[0] 
				when 'Weekly'
					@stock[quote.ticker] =
						{'ror' => (quote.ror.to_f ** (1.0 / @period_list.size)) ** 50,
						 'sortino' => quote.sortino.to_f}
				when 'Daily'
					@stock[quote.ticker] =
						{'ror' => (quote.ror.to_f ** (1.0 / @period_list.size)) ** 360,
						 'sortino' => quote.sortino.to_f}
			end
		end

		# Average return in percentage
		@stock_average = (@stock.values.collect{|x| x['ror'] - 1}.inject {|sum, n|
									sum + n} / @stock.keys.size * 100)  unless @stock.keys == []

		# Average risk-adjusted return in percentage
		@stock_sortino_average = (@stock.values.collect{|x| x['sortino']}.inject {|sum, n|
									sum + n} / @stock.keys.size)  unless @stock.keys == []
	end

	# Hotspot chart for PMs
 	def pm_hotspot
		if Pmp.count == 0
			flash[:notice] = "Portfolio managers haven't been trained."
			return
		end

		pm_performance if @pmp.nil?

		# Ror Hotspot
		File.open('.\gnuplot\pmp_ror.data', 'w+') do |f|
			@pmp.keys.each do |pm|
				f << pm.memory << " " << pm.confidence  << " "
				f << @pmp[pm]['ror'] * 100 - 100 << "\n"
			end
		end

		# Sortino Hotspot
		File.open('.\gnuplot\pmp_sortino.data', 'w+') do |f|
			@pmp.keys.each do |pm|
				f << pm.memory << " " << pm.confidence  << " "
				f << @pmp[pm]['sortino'] << "\n"
			end
		end

		case params[:plot_type]
			when '3D'
				`gnuplot/bin/gnuplot.exe gnuplot/pmp_ror.plot`
				`gnuplot/bin/gnuplot.exe gnuplot/pmp_sortino.plot	`
			when 'Flat'
				`gnuplot/bin/gnuplot.exe gnuplot/pmp_flat_ror.plot`
				`gnuplot/bin/gnuplot.exe gnuplot/pmp_flat_sortino.plot`
		end
	end

	def pm_hotspot_ror_chart
		send_file './gnuplot/pm_hotspot_ror.png', :type => 'image/png',
			:disposition => 'inline'
	end

	def pm_hotspot_sortino_chart
		send_file './gnuplot/pm_hotspot_sortino.png', :type => 'image/png',
			:disposition => 'inline'
	end

	# Timeline chart for invesotrs showing historical cumulative ROR
	def investor_timeline
		if Ip.count == 0
			flash[:notice] = "Investors haven't been trained."
			return
		end

    quote_types = User.find(session[:user_id]).profiles.map{|x| x.quote_type}.uniq
    if quote_types.size == 1 # Check if quote type is unified
      case quote_types[0] 
        when 'Weekly' : @rfr = 0.0413 / 50
        when 'Daily'  : @rfr = 0.0413 / 360
      end
    end

		start = @max_memory + Investor.maximum(:memory)

		# ROR Timeline
		File.open('.\gnuplot\ip_ror.data', 'w+') do |f|
			(start..(@period_list.size - 1)).each do |to|
				Ip.ror_timeline(@period_list[start], @period_list[to]).each do |ip|
					f << ip.ror.to_f * 100 << " " # ROR matrix
				end
				f << "\n" # Split the periods
			end
		end

		# Sortino Timeline
		File.open('.\gnuplot\ip_sortino.data', 'w+') do |f|
			(start..(@period_list.size - 1)).each do |to|
				Ip.sortino_timeline(@period_list[start], @period_list[to], @rfr).each do |ip|
					f << ip.sortino.to_f << " " # Sortino matrix
				end
				f << "\n" # Split the periods
			end
		end

		# Customize plot definition TODO

		case params[:plot_type]
			when '3D'
				`gnuplot/bin/gnuplot.exe gnuplot/ip_ror.plot`
				`gnuplot/bin/gnuplot.exe gnuplot/ip_sortino.plot	`
			when 'Flat'
				`gnuplot/bin/gnuplot.exe gnuplot/ip_flat_ror.plot`
				`gnuplot/bin/gnuplot.exe gnuplot/ip_flat_sortino.plot`
		end
	end

	def investor_timeline_ror_chart
		# Wait for gnuplot to produce the chart
		# sleep 1 until File.exist? 'gnuplot/pm_hotspot.png'

		# require 'rmagick'
		# Crop the imgae later
		send_file './gnuplot/investor_timeline_ror.png', :type => 'image/png',
			:disposition => 'inline'
	end

	def investor_timeline_sortino_chart
		send_file './gnuplot/investor_timeline_sortino.png', :type => 'image/png',
			:disposition => 'inline'
	end

	# Predict the best future portfolio structure in the next period
	def predict
		if Ip.count == 0
			flash[:notice] = "Investors haven't been trained."
			return
		end
		    
    quote_types = User.find(session[:user_id]).profiles.map{|x| x.quote_type}.uniq
    if quote_types.size == 1 # Check if quote type is unified
      case quote_types[0] 
        when 'Weekly' : @rfr = 0.0413 / 50
        when 'Daily'  : @rfr = 0.0413 / 360
      end
    end # TODO: else warning?

		# Find the best investor, track back to its ip, back to pm, back to next pi
		best = Ip.best_investor(@rfr)
		@best_investor = Investor.find(best.investor_id)
    
    case quote_types[0]
      when 'Weekly'
        @max_performance = (best.ror.to_f ** (1.0 / @best_investor.ips.count)) ** 50 - 1 # EAR
      when 'Daily'
        @max_performance = (best.ror.to_f ** (1.0 / @best_investor.ips.count)) ** 360 - 1
    end
    
    @final_pm = @best_investor.ips.find_by_date(@period_list.last).pm # Last day

		# Determine the portfolio structure in future
		final_pmp = @final_pm.pmps.find_by_actualized_date(@period_list.last)
		os = @period_list.index(final_pmp.optimized_date) # Trace back
		periods_left = os - (@period_list.size - 1) + @final_pm.confidence
		if periods_left > 0 # Still within confidence period
			# Retrieve the original portfolio structure
			@prediction = @final_pm.pis.find_all_by_date(final_pmp.optimized_date)
		else
			# Confidence period is over. Have to re-optimize the portfolio
      @prediction = @final_pm.pis.find_all_by_date(@period_list.last)
		end
	end

	# Historical winner's cumulative performance v.s. the portfolio cumulative mean
	# This is not easy since we have to pick winner period by period
	def benchmark
		if Ip.count == 0
			flash[:notice] = "Investors haven't been trained."
      redirect_to :controller => 'investors_admin'
			return
		elsif Pm.count == 0
      flash[:notice] = "Investors haven't been trained."
      redirect_to :controller => 'pms_admin'
			return
		end

    quote_types = User.find(session[:user_id]).profiles.map{|x| x.quote_type}.uniq
    if quote_types.size == 1 # Check if quote type is unified
      case quote_types[0] 
        when 'Weekly' : @rfr = 0.0413 / 50
        when 'Daily'  : @rfr = 0.0413 / 360
      end
    end
	
		# Find the winner
		@best_investor = Investor.find(Ip.best_investor(@rfr).investor_id)

		# Find the benchmark period
		@benchmark_periods = @period_list[(@period_list.size - @best_investor.ips.count)..
																				(@period_list.size - 1)]

		investor_ror_line, investor_sortino_line = [], []

		# Winner's historical cumulative ROR
		@benchmark_periods.each do |to|
			investor_ror_line <<
				Ip.winner_ror(@benchmark_periods.first, to, @best_investor).ror.to_f * 100
		end

		# Winner's historical sortino TODO
		# Notice: need at leat two periods to calculate deviation!

		temp = 0
		# Market historical cumulative ROR
    market_ror_line = Quote.calculate(:avg, :rate_of_return, :group => "date",
												:order => 'date',
                        :conditions => "date >= '#{@benchmark_periods.first.to_s}'
																				and date <= '#{@benchmark_periods.last.to_s}'").
												map{|x| temp += (x[1] * 100.0)}

	  # Market historical sortino TODO

		# Holding period return
		@market_average = market_ror_line.last
    @investor_average = Ip.investor_average(@benchmark_periods, @best_investor) * 100
    
    # Build the chart
    #require 'Gruff'
        
		#g_ror = Gruff::Line.new(600)
		#g_ror.title = "Benchmark on Cumulative Performance"

		#g_ror.data("The Best Investor", investor_ror_line)
		#g_ror.data("Portfolio Average", market_ror_line)

		# Select some period tags

		#(0..(@benchmark_periods.size - 1)).step(8) do |i|
		#	g_ror.labels[i] = @benchmark_periods[i].month.to_s + "/" +
		#										@benchmark_periods[i].day.to_s
		#end

		#g_ror.write('./gnuplot/benchmark.png')

    require 'scruffy'
    graph = Scruffy::Graph.new
    graph.title = "Benchmark on Cumulative Performance"
    graph.theme = Scruffy::Themes::Keynote  .new
    graph.add :line, "The Best Investor", investor_ror_line
    graph.add :line, "Portfolio Average", market_ror_line
    graph.render :to => './public/images/benchmark.svg'
	end

	#def benchmark_chart
	#	send_file './gnuplot/benchmark.png', :type => 'image/png', 
  #    :disposition => 'inline'
	#end

end

