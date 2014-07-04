# == Schema Information
#
# Table name: restaurants
#
#  id                    :integer          not null, primary key
#  name                  :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#  recommendations_count :integer          default(0)
#  sources_count         :integer          default(0)
#  website               :string(255)
#  sources_list          :integer          default([]), is an Array
#

class Restaurant < ActiveRecord::Base
	include Addressable

	has_many :recommendations, dependent: :destroy
	has_and_belongs_to_many :categories

	scope :showable, ->(user) { where("(?) IS NULL OR restaurants.id NOT IN (?)", user.no_show_restaurants, user.no_show_restaurants)}
	# source_showable doesn't return restaurants without any recommendations
	scope :source_showable, ->(user) { joins(recommendations: :recommendation_group)
																	 .where("(?) IS NULL OR 
																					recommendation_groups.source_id NOT IN (?)",
																				 user.no_show_sources,
																				 user.no_show_sources)
																	 .uniq}
	scope :not_tried_by, ->(user) { where("(?) IS NULL OR restaurants.id NOT IN (?)", user.tried_restaurants, user.tried_restaurants)}

	scope :only_categories, ->(categories) { joins(:categories)
																					.where("(?) IS NULL OR
																								 categories.name IN (?)",
																								categories,
																								categories)
																					.uniq}
	scope :except_categories, ->(categories) { joins(:categories)
																						.where("(?) IS NULL OR
																									 categories.name NOT IN (?)",
																									categories,
																									categories)
																						.uniq}
	
	def sources
		Source.find(sources_list)
	end
end
