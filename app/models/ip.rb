class Ip < ActiveRecord::Base
  belongs_to :investor
  belongs_to :pm
  set_table_name 'investor_performances'

	# Sortino ratio-based selection
	def self.best_investor(rfr)
	  Ip.find_by_sql("SELECT a.investor_id, b.ror, (b.ror - 1 - (#{rfr} * b.n)) / a.dsd as sortino
                    FROM (SELECT ip.investor_id,
                            sqrt(sum(power((ip.after_cost_return - c.average) / 100, 2)) / c.n ) as dsd
                          FROM investor_performances as ip
                          JOIN (SELECT investor_id, avg(after_cost_return) as average,
                                  count(after_cost_return) as n
                                FROM investor_performances
                                GROUP BY investor_id) as c
                          ON ip.investor_id = c.investor_id
                          WHERE after_cost_return - c.average < 0
                          GROUP BY investor_id) as a
                    JOIN (SELECT investor_id,
                            exp(sum(ln(after_cost_return / 100 + 1))) as ror,
                            count(after_cost_return) as n
                          FROM investor_performances
                          GROUP BY investor_id) as b
                    ON a.investor_id = b.investor_id
										ORDER BY sortino DESC
										LIMIT 1")[0]
	end

	# Whole timespan investor performance
	def self.performance(rfr)
	  Ip.find_by_sql("SELECT a.investor_id, b.ror, (b.ror - 1 - (#{rfr} * b.n)) / a.dsd as sortino
                    FROM (SELECT ip.investor_id,
                            sqrt(sum(power((ip.after_cost_return - c.average) / 100, 2)) / c.n ) as dsd
                          FROM investor_performances as ip
                          JOIN (SELECT investor_id, avg(after_cost_return) as average,
                                  count(after_cost_return) as n
                                FROM investor_performances
                                GROUP BY investor_id) as c
                          ON ip.investor_id = c.investor_id
                          WHERE after_cost_return - c.average < 0
                          GROUP BY investor_id) as a
                    JOIN (SELECT investor_id,
                            exp(sum(ln(after_cost_return / 100 + 1))) as ror,
                            count(after_cost_return) as n
                          FROM investor_performances
                          GROUP BY investor_id) as b
                    ON a.investor_id = b.investor_id")
	end

	# Timeline
	def self.ror_timeline(ps, pe)
		Ip.find_by_sql("SELECT memory,
													 exp(sum(ln(ip.after_cost_return / 100 + 1))) - 1 as ror
										FROM investor_performances as ip
										JOIN investors
										ON ip.investor_id = investors.id
										WHERE date >= '#{ps.to_s}'
										 and date <= '#{pe.to_s}'
										GROUP BY investors.id
										ORDER BY investors.memory")
	end

	# Timeline
	def self.sortino_timeline(ps, pe, rfr)
	  # Reduce repeated casting
    ps = ps.to_s
    pe = pe.to_s

		Ip.find_by_sql("SELECT inv.memory, (b.ror - 1 - (#{rfr} * b.n)) / a.dsd as sortino
                    FROM (SELECT ip.investor_id,
                            sqrt(sum(power((ip.after_cost_return - c.average) / 100, 2)) / c.n ) as dsd
                          FROM investor_performances as ip
                          JOIN (SELECT investor_id, avg(after_cost_return) as average,
                                  count(after_cost_return) as n
                                FROM investor_performances
																WHERE date >= '#{ps}'
                                  and date <= '#{pe}'
                                GROUP BY investor_id) as c
                          ON ip.investor_id = c.investor_id
                          WHERE after_cost_return - c.average < 0
														and date >= '#{ps}'
                            and date <= '#{pe}'
                          GROUP BY investor_id) as a
                    JOIN (SELECT investor_id,
                            exp(sum(ln(after_cost_return / 100 + 1))) as ror,
                            count(after_cost_return) as n
                          FROM investor_performances
													WHERE date >= '#{ps}'
                              and date <= '#{pe}'
                          GROUP BY investor_id) as b
                    ON a.investor_id = b.investor_id
										JOIN investors as inv
										ON inv.id = b.investor_id
										ORDER BY inv.memory")
	end

	# Winner ROR line for benchmark
	def self.winner_ror(ps, pe, investor)
		# Need to redo : stochastic dominance?
		Ip.find_by_sql("SELECT a.ror
										FROM (SELECT investor_id,
														exp(sum(ln(after_cost_return / 100 + 1))) - 1 as ror
													FROM investor_performances
													WHERE date >= '#{ps.to_s}'
														and date <= '#{pe.to_s}'
													GROUP BY investor_id) as a
										WHERE a.investor_id = '#{investor.id}'")[0]
  end

	# Benchmark average
	def self.investor_average(benchmark_periods, best_investor)
    Ip.find_by_sql("SELECT exp(sum(ln(after_cost_return / 100 + 1))) - 1 as ia
                    FROM investor_performances
                    WHERE date >= '#{benchmark_periods.first.to_s}'
                          and date <= '#{benchmark_periods.last.to_s}'
                          and investor_id = '#{best_investor.id}'")[0].ia.to_f
  end
end
