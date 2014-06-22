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

require 'rails_helper'

RSpec.describe Source, :type => :model do
	before(:each) do
		@source = FactoryGirl.create(:source)
	end

	it "creates new recommendations for existing restaurants" do
		FactoryGirl.create(:restaurant, :name => "Sam's Steaks")
		FactoryGirl.create(:restaurant, :name => "Larry's Lobsters")
		FactoryGirl.create(:restaurant, :name => "Rob's Roosters")
		input = [{:name => "Sam's Steaks"},{:name => "Larry's Lobsters"},{:name => "Rob's Roosters"}]
		@source.create_recommendations_from_json(input)
		expect(Recommendation.count).to eq(3)
		Restaurant.all.each do |r|
			expect(r.recommendations_count).to eq(1)
		end
		expect(@source.recommendations.count).to eq(3)
	end

	it "creates new recommendations for new restaurants" do
	end
end
