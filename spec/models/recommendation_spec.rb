# == Schema Information
#
# Table name: recommendations
#
#  id                      :integer          not null, primary key
#  restaurant_id           :integer
#  source_id               :integer
#  date_recommended        :date
#  created_at              :datetime
#  updated_at              :datetime
#  website                 :string(255)
#  recommendation_group_id :integer
#

require 'rails_helper'

RSpec.describe Recommendation, :type => :model do
	before(:each) do
		@recommendation = FactoryGirl.build(:recommendation)
	end

	it "updates restaurant's sources counts after create" do
		expect{@recommendation.save}.to change{@recommendation.restaurant.sources_count}.by(1)
	end
end
