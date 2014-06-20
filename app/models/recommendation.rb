class Recommendation < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :source
end
