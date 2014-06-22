# == Schema Information
#
# Table name: recommendations
#
#  id               :integer          not null, primary key
#  restaurant_id    :integer
#  source_id        :integer
#  date_recommended :date
#  created_at       :datetime
#  updated_at       :datetime
#

class Recommendation < ActiveRecord::Base
  belongs_to :restaurant, :counter_cache => true
  belongs_to :source
end
