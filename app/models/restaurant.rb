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
#

class Restaurant < ActiveRecord::Base
	include Addressable

	has_many :recommendations, dependent: :destroy
	has_and_belongs_to_many :categories

	scope :showable, ->(user) { where("id NOT IN (?)", user.no_show_restaurants)}
	# where any of its sources are not in user's no_show_sources
	
	def sources
		self.recommendations.map(&:source)
	end
end
