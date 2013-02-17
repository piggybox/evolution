#Omit the relationship between quote and portfolio items,
#cause it's useless and unnatural

class Quote < ActiveRecord::Base
  belongs_to :profile

  validates_presence_of :date, :ticker

  # ROR and risk-adjusted return
  def self.performance(rfr)
    Quote.find_by_sql("SELECT a.ticker,b.ror, (b.ror - 1 - (#{rfr} * b.n)) / a.dsd as sortino
                       FROM (SELECT q.ticker,
                               sqrt(sum(power((q.rate_of_return - c.average),2)) / c.n) as dsd
                             FROM quotes as q
                             JOIN (SELECT ticker, avg(rate_of_return) as average,
                                     count(rate_of_return) as n
                                   FROM quotes
                                   GROUP BY ticker) as c
                             ON q.ticker = c.ticker
                             WHERE q.rate_of_return - c.average < 0
                             GROUP BY ticker) as a
                             JOIN (SELECT ticker,
                                     exp(sum(ln(rate_of_return + 1)))  as ror,
                                     count(rate_of_return) as n
                                   FROM quotes
                                   GROUP BY ticker) as b
                             ON a.ticker = b.ticker")
  end
end
