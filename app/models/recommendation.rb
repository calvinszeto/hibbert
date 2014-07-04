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
	belongs_to :recommendation_group
	delegate :source,
		:to => :recommendation_group

	after_create :add_to_restaurant_sources_list
	after_destroy :remove_from_restaurant_sources_list
	after_create :update_restaurant_sources_count

	private
		def add_to_restaurant_sources_list()
			if !self.restaurant.sources_list.include? self.source
				self.restaurant.sources_list.push self.source.id
				self.restaurant.sources_list_will_change!
				self.restaurant.save
			end
		end

		def remove_from_restaurant_sources_list()
			if Recommendation.where(restaurant: self.restaurant)
											 .joins(:recommendation_group)
										   .where(recommendation_groups: {source_id: self.source.id})
										   .empty?
				self.restaurant.sources_list.delete self.source.id
				self.restaurant.sources_list_will_change!
				self.restaurant.save
			end
		end

		def update_restaurant_sources_count()
			# This may or may not increment, since sources may recommend
			# a restaurant more than once. Thus we cannot use a simple
			# counter cache.
			self.restaurant.sources_count = self.restaurant.sources.count
		end
end
