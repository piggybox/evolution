# Portfolio manager
class Pm < ActiveRecord::Base
	has_many :pis # Portfolio items
  has_many :pmps # Portfolio manager performances
  has_many :ips # Investor performance

  validates_presence_of :memory, :confidence
  validates_numericality_of :memory, :confidence

  # Maximum training period: half  
  max_period = Quote.find(:all, :select => 'distinct date').size
  validates_inclusion_of :memory,
    :in => 2..(max_period / 2),
    :message => "Failed constraint: 2 <= max(pm.memory) < total_periods"

  # Upper limit of confidence?  
	validates_each :confidence do |record, attr|
      record.errors.add 'Confidence', '< 1' if record.confidence < 1
  end

end
