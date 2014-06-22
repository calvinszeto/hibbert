require 'rails_helper'

RSpec.describe Source, :type => :model do
	before(:each) do
		@source = Source.create
	end

	it "creates new recommendations for existing restaurants" do
		Restaurant.create :name => "Sam's Steaks"
		Restaurant.create :name => "Larry's Lobsters"
		Restaurant.create :name => "Rob's Roosters"
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
