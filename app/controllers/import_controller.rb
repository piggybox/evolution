# Import and clean historical or real-time (TBD) quotes

class ImportController < ApplicationController
	layout "evolution"
	before_filter :authorize

	def initialize
    super
    @period_list = Quote.find(:all, :order => 'date', 
                              :select => 'distinct date').map {|x| x.date}
	end

	def initialize_category
		# Initialize sector, industry and member stocks from Yahoo! Finance
		require 'rubyful_soup'

    # Run-once operation:
		#import_sectors
		#import_industries
		#import_profiles

    redirect_to :controller => 'profiles_admin', :action => 'list'
	end

	def import_quotes
    # TODO: incremental import

    # Check if all stocks are already imported
    status = User.find(session[:user_id]).profiles.map{|x| x.status}.uniq
    if status.size == 1 and status[0] == 'Imported'
      flash[:notice] = "Incrememtal importing hasn't been implemented.
                        <br>Please delete all quotes first then import new periods."
      redirect_to :controller => 'quotes_admin', :action => 'list'
      return
    end
    
    require 'open-uri'
    require 'faster_csv'
    date_from = new_date(params[:date_from].split('-').map {|x| x.to_i })
    date_to = new_date(params[:date_to].split('-').map {|x| x.to_i })

		User.find(session[:user_id]).profiles.each do |stock|
			if stock.status == 'Waiting'
				retrieve_stock(stock.ticker, date_from, date_to,
					params[:data_type].to_sym, stock.currency.to_sym)
        p = Profile.find_by_ticker(stock.ticker) 
        p.quote_type = params[:data_type]
        p.status = 'Imported'
        p.save
			end
			# Skip imported profiles
		end

		clean_quotes # ETL process

	  flash[:notice] = "The data of your portfolio have been imported and cleaned."
    redirect_to :controller => 'quotes_admin', :action => 'list'
	end

	private

	# Create a date from a numeric list: [2000, 01, 06]
	def new_date(date)
		Date.new(date[0], date[1], date[2])
	end

	def retrive_index
		#http://finance.yahoo.com/q/cp?s=%5ENDX
		# Get the composition (stocks list) of index

	end

	def retrieve_profile(ticker)
		# Get details on the company profile
		# like sector/industry, average marekt capitalization, P/E, PEG, etc.

	end

	def retrieve_stock(ticker, from, to, type=:Weekly, currency=:USD)
    profile = Profile.find_by_ticker(ticker.to_s)

	  # Weekly quotes from USA by default imported from Yahoo!Finance
	  url = "http://ichart.finance.yahoo.com/table.csv?"
	  url << "s=#{currency == :CAN ? ticker + '.to' : ticker}&"
	  url << "a=#{from.month - 1}&" << "b=#{from.day}&"
	  url << "c=#{from.year}&" << "d=#{to.month - 1}&"
	  url << "e=#{to.day}&" << "f=#{to.year}&"
	  # Be ware of capitalized string comparasion
	  url << "g=#{type == :Weekly ? 'w' : 'd'}&ignore=.csv"

		begin
      body = open(url)
      FasterCSV.parse(body, :headers => true) do |row| # Omit the first line
        q = Quote.new
        q.ticker	= ticker.upcase
        q.open 		= row[1]
        q.high 		= row[2]
        q.low  		= row[3]
        q.close 	= row[4]
        q.volume 	= row[5]
        q.adjusted_close = row[6]
  
        # !!! buggy logic due to multiple forms of yahoo data
        # The date is inserted from older to earlier
        #temp = row[0].split('-')
        # Year 2000 bug
        #temp[2] =  temp[2].to_i < 50 ? '20' + temp[2] : '19' + temp[2]
        #q.date = temp.join('-')        
        q.date = row[0]
        
        # Normalize the date to Monday to clean weekly data
        q.date -= 1 while q.date.cwday != 1 and type == :weekly
  
        profile.quotes << q
      end # End of parsing
  
      # Calculate the rate of return
      calculate_ror(ticker)
    rescue OpenURI::HTTPError => e # Quotes didn't exist during given periods
      print "[Warn] Quotes of ", ticker, " didn't exist during period from ",
            from, " to ", to
    end
	end

	def adjust_currency
	  # Currency concern: historical exchange rate?
	end

  # slow...
	def calculate_ror(ticker)
		quotes = Quote.find_all_by_ticker(ticker, :order => "date") # Ascending
		quotes.each_with_index do |quote, index|
			temp = quote.adjusted_close
			unless quotes[index + 1].nil?
				quotes[index + 1].rate_of_return =
					(quotes[index + 1].adjusted_close / temp) - 1
			end
			quote.save
		end

		# Delete the first quote without ROR
		quotes[0].destroy
	end

	def clean_quotes
		tickers = User.find(session[:user_id]).profiles.map {|x| x.ticker}
    periods = Quote.find(:all, :order => 'date',  # @period_list is unvailable here?
                         :select => 'distinct date').map {|x| x.date}
                         
		periods.each do |date|
			tickers.each do |ticker|
				# If the quote is missing, we assume the price remains same as in th
				# previous period, therefore the ROR is 0.
				if Quote.find_by_date_and_ticker(date, ticker).nil?
					quote = Quote.new
					quote.date = date
          quote.volume = -1000 # Special tag for virtual quotes
					quote.ticker = ticker
					quote.rate_of_return = 0
          Profile.find_by_ticker(ticker).quotes << quote
          print "[info] Quote of ", ticker, " has been cleaned at ", date, "\n"
				end
			end
		end
	end
	
	def import_sectors
		url = "http://biz.yahoo.com/p/s_conameu.html"
		input = open(url).read
		soup = BeautifulSoup.new(input)
		sectors = soup.find_all('table')[4].find_all('tr')
		sectors[1..sectors.size].each do |sector| # Omit the first row
			s = Sector.new
			s.url = "http://biz.yahoo.com/p/" + sector.a['href']
			s.name = sector.a.font.string.gsub(/\n/, ' ') # Replace \n with a space
			s.status = 'Waiting'
			s.save
		end
	end

	def import_industries
		Sector.find_all.each do |sector|
			input = open(sector.url).read
			soup = BeautifulSoup.new(input)
			industries = soup.find_all('table')[4].find_all('tr')
			industries[3..industries.size].each do |industry| # Omit the first 3 rows
				i = Industry.new
				i.url = "http://biz.yahoo.com/p/" + industry.a['href']
				i.name = industry.a.font.string.gsub(/\n/, ' ') # Replace \n with a space
				i.status = 'Waiting'
				sector.industries << i
			end
			sector.status = 'Imported'
			sector.save
		end
	end

	def import_profiles
		Industry.find_all.each do |industry|
			input = open(industry.url).read
			soup = BeautifulSoup.new(input)
			profiles = soup.find_all('table')[4].find_all('tr')
			profiles[4..profiles.size].each do |profile| # Omit the first 4 rows
				links = profile.find_all('a')
				if links.size <= 1 or links[1].string =~ /.OB/ 
					next # Skip the mis-quoted or over-the-counter stock
				else
					p = Profile.new
					p.name = links[0].string.gsub(/\n/, ' ') # Replace \n with a space
					p.ticker = links[1].string
					p.currency = 'USD'
					p.status = 'Waiting'
					industry.profiles << p
				end
			end
			industry.status = 'Imported'
			industry.save
		end
	end
  
end
