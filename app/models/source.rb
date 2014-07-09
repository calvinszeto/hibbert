# == Schema Information
#
# Table name: sources
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  category    :string(255)
#  website     :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  description :text
#

class Source < ActiveRecord::Base
	has_many :recommendation_groups, dependent: :destroy
	has_many :recommendations, through: :recommendation_groups

	validates :name, presence: true
	validates :name, :uniqueness => {case_sensitive: false}
	validates :category, inclusion: {in: ["Blog", "TV Show", "Critic"],
		message: "%{value} is not a valid category."}

	scope :showable, ->(user) { where("(?) IS NULL OR sources.id NOT IN (?)",
																		user.no_show_sources, 
																		user.no_show_sources)}

	# Depends on Addressable#near
	# Also, it returns source ids
	# TODO: Refactor this. It's very bad.
	attr_accessor :nearby_restaurants_count
	def self.sources_near(sources, location, distance)
		restaurants = Restaurant.near(Restaurant.all, location, distance)
		expanded_sources = restaurants.map(&:sources).reduce([], :+)
		near_sources = expanded_sources.reduce({}) do |hash, source|
			hash[source.id] = hash[source.id] ? hash[source.id] + 1 : 1
			hash
		end
		near_sources.sort_by {|source, count| count}
		sources = sources.where(id: near_sources.keys).each do |source|
			source.nearby_restaurants_count = near_sources[source.id]
		end
	end

end
