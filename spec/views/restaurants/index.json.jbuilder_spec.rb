require 'rails_helper'

RSpec.describe "restaurants/index", type: :view do
	it "should return all restaurants" do
		assign(:restaurants, FactoryGirl.create_list(:restaurant, 5))
		assign(:no_filter, false)
		render
		expect(JSON.parse(rendered).count).to eq(Restaurant.count)
	end

	context "with :no_filter=true" do
		it "should return no_show status" do
			user = FactoryGirl.create :user
			sign_in user
			bad_restaurant = FactoryGirl.create :restaurant
			user.add_no_show_restaurant bad_restaurant

			assign(:restaurants, FactoryGirl.create_list(:restaurant, 5) + [bad_restaurant])
			assign(:user, user)
			assign(:no_filter, true)

			render
			expect(JSON.parse(rendered).first).to have_key("no_show")
			expect(JSON.parse(rendered)
						 .select{|s| s["id"] == bad_restaurant.id}.first["no_show"]).to eq(true)
		end
	end

	context "with :tried=true" do
		it "should return tried status" do
			user = FactoryGirl.create :user
			sign_in user
			tried_restaurant = FactoryGirl.create :restaurant
			user.add_tried_restaurant tried_restaurant

			assign(:restaurants, FactoryGirl.create_list(:restaurant, 5) + [tried_restaurant])
			assign(:user, user)
			assign(:tried, true)

			render
			expect(JSON.parse(rendered).first).to have_key("tried")
			expect(JSON.parse(rendered)
						 .select{|s| s["id"] == tried_restaurant.id}.first["tried"]).to eq(true)
		end
	end
	
	context "with :location=error" do
		it "should return an error message" do
			assign(:restaurants, FactoryGirl.create_list(:restaurant, 3))
			assign(:location, "error")
			render
			expect(JSON.parse(rendered).first).to have_key("error")
			expect(JSON.parse(rendered).first["error"]).not_to be_empty
		end
	end

	context "with valid :location" do
		it "should return distance and searched_location" do
			assign(:restaurants, FactoryGirl.create_list(:restaurant, 3))
			Restaurant.all.each {|r| r.distance = 3}
			assign(:location, "123 Fake St.")
			render
			expect(JSON.parse(rendered).first).to have_key("distance")
			expect(JSON.parse(rendered).first).to have_key("searched_location")
		end
	end
end
