class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_many :ratings, through: :reviews
  belongs_to :city
  # Remember to create a migration!
end
