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

has_many :recommendations, dependent: :destroy

validates :category, inclusion: {in: ["Blog", "TV Show", "Critic"],
	message: "%{value} is not a valid category."}

def create_recommendations_from_json(input)
	input.each do |record|
		if restaurant = Restaurant.find_by(:name => record[:name])
		else
			restaurant = Restaurant.create(:name => record[:name])
		end
		Recommendation.create(:restaurant => restaurant,
												 :source => self)
	end
end

end
