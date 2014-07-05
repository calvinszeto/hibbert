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

	private
		def add_to_restaurant_sources_list()
			self.restaurant.update_sources_list('create', self.source)
		end

		def remove_from_restaurant_sources_list()
			self.restaurant.update_sources_list('destroy', self.source)
		end
end
