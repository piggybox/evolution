#Portfolio manager performance
class Pmp < ActiveRecord::Base
  belongs_to :pm
  set_table_name 'pm_performances'

  # Choose the PM with best Sortino ratio within tracing period
  def self.best_pm(ps, pe)
    # Reduce repeated casting
    ps = ps.to_s
    pe = pe.to_s

    # Caculate average, downside standard deviation, and sortino ratio, then sort
    # Notice that risk-free rate is omitted on purpose, since it has no effect on
    # the final result but slow down the calculation.
    Pmp.find_by_sql("SELECT a.pm_id, b.ror / a.dsd as sortino
                     FROM (SELECT pmp.pm_id,
                            sqrt(sum(power((pmp.after_cost_return - c.average) / 100, 2)) / c.n ) as dsd
                          FROM pm_performances as pmp
                          JOIN (SELECT pm_id, avg(after_cost_return) as average,
                                  count(after_cost_return) as n
                                FROM pm_performances
                                WHERE actualized_date >= '#{ps}'
                                  and actualized_date <= '#{pe}'
                                GROUP BY pm_id) as c
                          ON pmp.pm_id = c.pm_id
                          WHERE after_cost_return - c.average < 0
                            and actualized_date >= '#{ps}'
                            and actualized_date <= '#{pe}'
                          GROUP BY pm_id) as a
                      JOIN (SELECT pm_id,
                              exp(sum(ln(after_cost_return / 100 + 1))) - 1 as ror
                            FROM pm_performances
                            WHERE actualized_date >= '#{ps}'
                              and actualized_date <= '#{pe}'
                            GROUP BY pm_id) as b
                      ON a.pm_id = b.pm_id
                      ORDER BY sortino DESC
                      LIMIT 1")[0].pm_id
  end

  def self.performance(rfr)
    Pmp.find_by_sql("SELECT a.pm_id, b.ror, (b.ror - 1 - (#{rfr} * b.n)) / a.dsd as sortino
                     FROM (SELECT pmp.pm_id,
                            sqrt(sum(power((pmp.after_cost_return - c.average) / 100, 2)) / c.n ) as dsd
                          FROM pm_performances as pmp
                          JOIN (SELECT pm_id, avg(after_cost_return) as average,
                                  count(after_cost_return) as n
                                FROM pm_performances
                                GROUP BY pm_id) as c
                          ON pmp.pm_id = c.pm_id
                          WHERE after_cost_return - c.average < 0
                          GROUP BY pm_id) as a
                      JOIN (SELECT pm_id,
                              exp(sum(ln(after_cost_return / 100 + 1))) as ror,
                              count(after_cost_return) as n
                            FROM pm_performances
                            GROUP BY pm_id) as b
                      ON a.pm_id = b.pm_id")
  end

  # Weighted actualized return
  def self.actualized_return(pmp, last_day, pm)
    Pmp.find_by_sql("SELECT
                       sum(portfolio_items.fraction * quotes.rate_of_return) as ror
                     FROM portfolio_items, quotes
                     WHERE quotes.date = '#{pmp.actualized_date}'
                       and quotes.ticker = portfolio_items.ticker
                       and portfolio_items.date = '#{last_day}'
                       and portfolio_items.pm_id = '#{pm.id}'")[0].ror.to_f
  end

end
