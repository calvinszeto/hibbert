# == Schema Information
#
# Table name: recommendations
#
#  id                      :integer          not null, primary key
#  restaurant_id           :integer
#  created_at              :datetime
#  updated_at              :datetime
#  recommendation_group_id :integer
#

require 'rails_helper'

RSpec.describe Recommendation, :type => :model do
	before(:each) do
		@recommendation = FactoryGirl.build(:recommendation)
	end

	it "validates recommendation of a unique restaurant per recommendation group" do
		FactoryGirl.create(:recommendation, 
											 recommendation_group: @recommendation.recommendation_group,
											 restaurant: @recommendation.restaurant)
		expect(@recommendation.valid?).to eq(false)
	end

	it "updates restaurant's sources_list after create" do
		@recommendation.save
		expect(@recommendation.restaurant.sources_list).to include(@recommendation.source.id)
	end

	it "updates restaurant's sources counts after create" do
		expect{@recommendation.save}.to change{@recommendation.restaurant.sources_count}.by(1)
	end
end
