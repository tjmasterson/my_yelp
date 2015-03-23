class City < ActiveRecord::Base
  has_many :restaurants
  has_many :users
  # Remember to create a migration!


end
