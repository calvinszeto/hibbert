require 'rails_helper'

RSpec.describe "recommendation_groups/show", type: :view do
	it "should return recommendation group attributes" do
		assign(:recommendation_group, FactoryGirl.create(:recommendation_group))
		render
		["id", "name", "website", "date", "description"].each do |key|
			expect(JSON.parse(rendered)).to have_key(key)
		end
	end

	it "should return recommendations" do
		assign(:recommendation_group, 
					 FactoryGirl.create(:recommendation_group_with_recommendations))
		render
		expect(JSON.parse(rendered)).to have_key("recommendations")
		["restaurant_id", "restaurant_name", "restaurant_categories"].each do |key|
			expect(JSON.parse(rendered)["recommendations"].
						 first).to have_key(key)
		end
	end

	context "with user signed in" do
		it "should return recommendation tried and no_show preferences" do
			user = FactoryGirl.create :user
			rg = FactoryGirl.create(:recommendation_group_with_recommendations)
			res = rg.recommendations.last.restaurant
			sign_in user
			assign(:recommendation_group, rg)
			assign(:user, user)
			user.add_no_show_restaurant(res)
			user.add_tried_restaurant(res)
			render
			["tried_restaurant", "no_show_restaurant"].each do |key|
				expect(JSON.parse(rendered)["recommendations"].
							 first).to have_key(key)
				expect(JSON.parse(rendered)["recommendations"].
							select{|r| r["restaurant_id"] == res.id}.first[key]).to eq(true)
			end
		end
	end
end

