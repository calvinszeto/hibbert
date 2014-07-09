require 'rails_helper'

RSpec.describe "users/show", type: :view do
	it "should return user attributes" do
		assign(:user, FactoryGirl.create(:user))
		render
		["id", "email"].each do |key|
			expect(JSON.parse(rendered)).to have_key(key)
		end
	end

	it "should return no_show_sources" do
		source = FactoryGirl.create :source
		user = FactoryGirl.create(:user)
		user.add_no_show_source(source)
		assign(:user, user)
		render
		expect(JSON.parse(rendered)).to have_key("no_show_sources")
		expect(JSON.parse(rendered)["no_show_sources"].
					 first).to have_key("id")
		expect(JSON.parse(rendered)["no_show_sources"].
					 first["id"]).to eq(source.id)
	end

	it "should return no_show_restaurants" do
		restaurant = FactoryGirl.create :restaurant
		user = FactoryGirl.create(:user)
		user.add_no_show_restaurant(restaurant)
		assign(:user, user)
		render
		expect(JSON.parse(rendered)).to have_key("no_show_restaurants")
		expect(JSON.parse(rendered)["no_show_restaurants"].
					 first).to have_key("id")
		expect(JSON.parse(rendered)["no_show_restaurants"].
					 first["id"]).to eq(restaurant.id)
	end

	it "should return tried_restaurants" do
		restaurant = FactoryGirl.create :restaurant
		user = FactoryGirl.create(:user)
		user.add_tried_restaurant(restaurant)
		assign(:user, user)
		render
		expect(JSON.parse(rendered)).to have_key("tried_restaurants")
		expect(JSON.parse(rendered)["tried_restaurants"].
					 first).to have_key("id")
		expect(JSON.parse(rendered)["tried_restaurants"].
					 first["id"]).to eq(restaurant.id)
	end
end
