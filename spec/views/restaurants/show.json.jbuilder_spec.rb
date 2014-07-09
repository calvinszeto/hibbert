require 'rails_helper'

RSpec.describe "restaurants/show", type: :view do
	before(:each) do
		@restaurant = FactoryGirl.create :restaurant
	end

	it "should return restaurant attributes" do
		assign(:restaurant, @restaurant)
		render
		["id", "name", "categories_list", "website"].each do |key|
			expect(JSON.parse(rendered)).to have_key(key)
		end
	end
	
	it "should return sources" do
		assign(:restaurant, @restaurant)
		render
		expect(JSON.parse(rendered)).to have_key("sources")
		["name", "category", "website", "recommendation_groups"].each do |key|
			expect(JSON.parse(rendered)["sources"].first).to have_key(key)
		end
	end

	context "with user signed in" do
		before(:each) do
			@user = FactoryGirl.create :user
			sign_in @user
		end

		it "should show no_show preference" do
			@user.add_no_show_restaurant @restaurant
			assign(:restaurant, @restaurant)
			assign(:user, @user)
			render
			expect(JSON.parse(rendered)).to have_key("no_show")
			expect(JSON.parse(rendered)["no_show"]).to eq(true)
		end

		it "should show no_show preference" do
			@user.add_tried_restaurant @restaurant
			assign(:restaurant, @restaurant)
			assign(:user, @user)
			render
			expect(JSON.parse(rendered)).to have_key("tried")
			expect(JSON.parse(rendered)["tried"]).to eq(true)
		end
	end
end

