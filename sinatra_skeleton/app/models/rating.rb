class Rating < ActiveRecord::Base
  belongs_to :review

  # Remember to create a migration!
end
