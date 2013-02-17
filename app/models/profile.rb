class Profile < ActiveRecord::Base
	validates_presence_of :ticker
	validates_uniqueness_of :ticker

	has_many :quotes
	belongs_to :industry
  has_many :portfolios
  has_many :users, :through => :portfolios

	# TODO: validate that the import types should be same
end                                                                    
