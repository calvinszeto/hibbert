# == Schema Information
#
# Table name: categorizations
#
#  id            :integer          not null, primary key
#  category_id   :integer
#  restaurant_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Categorization < ActiveRecord::Base
  belongs_to :category
  belongs_to :restaurant

	after_create :add_to_restaurant_categories_list
	after_destroy :remove_from_restaurant_categories_list

	private
		def add_to_restaurant_categories_list()
			self.restaurant.update_categories_list('create', self.category) unless self.restaurant.nil?
		end

		def remove_from_restaurant_categories_list()
			self.restaurant.update_categories_list('destroy', self.category) unless self.restaurant.nil?

		end
end
