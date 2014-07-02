# == Schema Information
#
# Table name: recommendations
#
#  id                      :integer          not null, primary key
#  restaurant_id           :integer
#  created_at              :datetime
#  updated_at              :datetime
#  recommendation_group_id :integer
#

class Recommendation < ActiveRecord::Base
	validates :restaurant_id, :presence => true

  belongs_to :restaurant, :counter_cache => true

	after_create :update_restaurant_sources_count

	private
		def update_restaurant_sources_count()
			# This may or may not increment, since sources may recommend
			# a restaurant more than once. Thus we cannot use a simple
			# counter cache.
			self.restaurant.sources_count = self.restaurant.sources.count
		end
end
