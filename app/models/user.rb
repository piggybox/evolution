require "digest/sha1"

class User < ActiveRecord::Base
  has_many :portfolios
  has_many :profiles, :through => :portfolios
  
	attr_accessor :password
	attr_accessible :name, :password
  
	validates_uniqueness_of :name
	validates_presence_of :name, :password
	
	def before_create
		self.hashed_password = User.hash_password(self.password)
	end
	
	def after_create
		@password = nil
	end

	def self.login(name, password)
		hashed_password = hash_password(password || "")
		find(:first, :conditions => ["name = ? and hashed_password = ?", 
				 													name, hashed_password])
	end
	
	def try_to_login
		User.login(self.name, self.password)
	end
	
	private
	
	def self.hash_password(password)
		Digest::SHA1.hexdigest(password)
	end
	
end
