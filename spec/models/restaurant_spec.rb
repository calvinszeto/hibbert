# == Schema Information
#
# Table name: restaurants
#
#  id                    :integer          not null, primary key
#  name                  :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#  recommendations_count :integer          default(0)
#  sources_count         :integer          default(0)
#  website               :string(255)
#

require 'rails_helper'

RSpec.describe Restaurant, :type => :model do
	before(:each) do
		@restaurant = FactoryGirl.create(:restaurant)
	end

	context "scope showable" do
		it "should return restaurants which are not in the user's no_show_restaurants" do
			user = FactoryGirl.create(:user)
			bad_restaurant = FactoryGirl.create(:restaurant)
			user.no_show_restaurants.push(bad_restaurant.id)
			expect(Restaurant.showable(user).to_a).to eq([@restaurant])
		end
	end

	context "source_showable" do
		it "should return true if restaurant is not recommended by a bad source" do
			user = FactoryGirl.create(:user)
			expect(@restaurant.source_showable(user)).to eq(true)
		end

		it "should return false if restaurant is recommended by a bad source" do
			user = FactoryGirl.create(:user)
			bad_restaurant = FactoryGirl.create(:restaurant)
			recommendation = FactoryGirl.create(:recommendation, :restaurant => bad_restaurant)	
			user.no_show_sources.push(recommendation.source)
			expect(bad_restaurant.source_showable(user)).to eq(false)
		end
	end

	context "scope source_showable" do
		it "should filter any restaurants recommended by bad sources"
	end

end
