class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  has_many :ratings
  # Remember to create a migration!
end
