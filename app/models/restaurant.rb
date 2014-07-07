# == Schema Information
#
# Table name: restaurants
#
#  id                    :integer          not null, primary key
#  name                  :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#  recommendations_count :integer          default(0)
#  website               :string(255)
#  sources_list          :integer          default([]), is an Array
#  categories_list       :string(255)      default([]), is an Array
#

class Restaurant < ActiveRecord::Base
	include Addressable

	has_many :recommendations, dependent: :destroy
	has_many :categorizations, dependent: :destroy
	has_many :categories, through: :categorizations

	scope :showable, ->(user) { where("(?) IS NULL OR restaurants.id NOT IN (?)",
																		user.no_show_restaurants, 
																		user.no_show_restaurants)}
	scope :source_showable, ->(user) { where(
									 	 "(?) IS NULL OR NOT ((?) = ANY (sources_list))",
																					 user.no_show_sources, 
																					 user.no_show_sources)}
	scope :not_tried_by, ->(user) { where("(?) IS NULL OR restaurants.id NOT IN (?)",
																				user.tried_restaurants, 
																				user.tried_restaurants)}

	scope :only_categories, ->(categories) { where("(?) IS NULL OR
																								 ((?) = ANY (categories_list))",
																								categories,
																								categories)}
	scope :except_categories, ->(categories) { where("(?) IS NULL OR
																								 NOT ((?) = ANY (categories_list))",
																									categories,
																									categories)}

	scope :order_by_reputation, ->() { select('*, array_length(sources_list, 1) as s_count') 
																		.order('s_count DESC')
																		.order(recommendations_count: :desc)}
	
	def sources
		Source.find(sources_list)
	end

	def sources_count
		sources_list.count
	end

	def update_sources_list(operation, source)
		if operation == 'create' && !sources_list.include?(source.id)
			sources_list.push source.id
		elsif operation == 'destroy' && Recommendation.where(restaurant: self)
											 .joins(:recommendation_group)
										   .where(recommendation_groups: {source_id: source.id})
										   .empty?
			sources_list.delete source.id
		else
			return
		end
		self.sources_list_will_change!
		self.save
	end

	def update_categories_list(operation, category)
		if operation == 'create' && !categories_list.include?(category.name)
			categories_list.push category.name
		elsif operation == 'destroy' && Categorization.where(restaurant: self)
											 .joins(:category)
										   .where(categories: {name: category.name})
										   .empty?
			categories_list.delete category.name
		else
			return
		end
		self.categories_list_will_change!
		self.save
	end
end
