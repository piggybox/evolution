# Weights of portfolio members at every period of time
class Pi < ActiveRecord::Base
	belongs_to :pm
  set_table_name 'portfolio_items'

 	validates_presence_of :date, :ticker

 	# Problem to establish many-to-many relationship accross 3 tables,
 	# so I break one relationship and maintain it by hand here.
 	# Qutoes are just raw data to build dataware, not that important.
 	def synchronize(quote)
		self.ticker = quote.ticker
		self.date = quote.date
 	end

end
