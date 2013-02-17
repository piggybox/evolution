class Industry < ActiveRecord::Base
	has_many :profiles
	belongs_to :sector
end
