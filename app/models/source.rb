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

	validates :category, inclusion: {in: ["Blog", "TV Show", "Critic"],
		message: "%{value} is not a valid category."}

end
