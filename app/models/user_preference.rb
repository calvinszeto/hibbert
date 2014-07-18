# == Schema Information
#
# Table name: user_preferences
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  no_show_sources     :integer          default([]), is an Array
#  no_show_restaurants :integer          default([]), is an Array
#  tried_restaurants   :integer          default([]), is an Array
#  created_at          :datetime
#  updated_at          :datetime
#

class UserPreference < ActiveRecord::Base
  belongs_to :user

	def add_no_show_source(source)
		unless no_show_sources.include? source.id
			self.no_show_sources.push(source.id)
			self.no_show_sources_will_change!
			self.save
		end
	end

	def remove_no_show_source(source)
		if no_show_sources.include? source.id
			self.no_show_sources.delete(source.id)
			self.no_show_sources_will_change!
			self.save
		end
	end

	def add_no_show_restaurant(restaurant)
		unless no_show_restaurants.include? restaurant.id
			self.no_show_restaurants.push(restaurant.id)
			self.no_show_restaurants_will_change!
			self.save
		end
	end

	def remove_no_show_restaurant(restaurant)
		if no_show_restaurants.include? restaurant.id
			self.no_show_restaurants.delete(restaurant.id)
			self.no_show_restaurants_will_change!
			self.save
		end
	end

	def add_tried_restaurant(restaurant)
		unless tried_restaurants.include? restaurant.id
			self.tried_restaurants.push(restaurant.id)
			self.tried_restaurants_will_change!
			self.save
		end
	end

	def remove_tried_restaurant(restaurant)
		if tried_restaurants.include? restaurant.id
			self.tried_restaurants.delete(restaurant.id)
			self.tried_restaurants_will_change!
			self.save
		end
	end
end
