# User's initial selection of certain profiles to be analyzed
class Portfolio < ActiveRecord::Base
  #set_table_name 'users_profiles'
  
  belongs_to :profile       
  belongs_to :user                                     
end
