# == Schema Information
#
# Table name: recommendation_groups
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  website     :string(255)
#  source_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#  date        :date
#  description :text
#

class RecommendationGroup < ActiveRecord::Base
  belongs_to :source

	validates :name, presence: true

	has_many :recommendations, dependent: :destroy

	scope :find_by_source_name, ->(name) { joins(:source)
																				.where(sources: {name: name})}
end
