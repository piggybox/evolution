class Investor < ActiveRecord::Base
  has_many :ips # Investor performance

  validates_presence_of :memory
  validates_numericality_of :memory

  max_period = Quote.find(:all, :select => 'distinct date').size
  max_pmm = Pm.maximum :memory
  validates_inclusion_of :memory, :in => 2..((max_period*2/3).to_i - (max_pmm or 1000)),
    :message => "Failed constraint: max(investor.memory) < total_periods - max(pm.memory)"

end
