# == Schema Information
#
# Table name: restaurants
#
#  id                    :integer          not null, primary key
#  name                  :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#  recommendations_count :integer          default(0)
#  website               :string(255)
#  sources_list          :integer          default([]), is an Array
#  categories_list       :string(255)      default([]), is an Array
#

require 'rails_helper'

RSpec.describe Restaurant, :type => :model do
	before(:each) do
		@restaurant = FactoryGirl.create(:restaurant)
	end

	context "sources_near method" do
		it "should return only sources which have restaurants near the location" do
			allow_any_instance_of(Address).to receive(:geocode)
			FactoryGirl.create :address, :addressable => @restaurant
			near_source = @restaurant.sources.first
		  far_restaurant = FactoryGirl.create(:restaurant)
			FactoryGirl.create :address, distance: 6, :addressable => far_restaurant
			far_source = far_restaurant.sources.first
	  	expect(Restaurant.sources_near(Restaurant.all, 
																		 [@restaurant.latitude, @restaurant.longitude],
																		5)).to match_array([near_source.id])
		end
	end

	context "scope showable" do
		it "should return all restaurants if user has no no_show_restaurants" do
			user = FactoryGirl.create(:user)
			expect(Restaurant.showable(user).to_a).to eq([@restaurant])
		end

		it "should return restaurants which are not in the user's no_show_restaurants" do
			user = FactoryGirl.create(:user)
			bad_restaurant = FactoryGirl.create(:restaurant)
			user.add_no_show_restaurant(bad_restaurant)
			expect(Restaurant.showable(user).to_a).to eq([@restaurant])
		end
	end

	context "scope source_showable" do
		it "should return all restaurants if user has no no_show_sources" do
			user = FactoryGirl.create(:user)
			expect(Restaurant.not_tried_by(user).to_a).to eq([@restaurant])
		end

		it "should filter any restaurants recommended by any bad sources" do
			user = FactoryGirl.create(:user)
			bad_restaurant = FactoryGirl.create(:restaurant)
			bad_recommendation = bad_restaurant.recommendations.first
			good_recommendation = FactoryGirl.create(:recommendation,
																							:restaurant => bad_restaurant)
			user.add_no_show_source(bad_recommendation.source)
			expect(Restaurant.source_showable(user).to_a).to eq([@restaurant])
		end

		it "should only return one instance of each restaurant" do
			user = FactoryGirl.create(:user)
			second_good_recommendation = FactoryGirl.create :recommendation,
				:restaurant => @restaurant
			expect(Restaurant.source_showable(user).to_a).to eq([@restaurant])
		end
	end

	context "scope not_tried_by" do
		it "should return all restaurants if user has no tried_restaurants" do
			user = FactoryGirl.create(:user)
			expect(Restaurant.not_tried_by(user).to_a).to eq([@restaurant])
		end

		it "should return restaurants which are not in the user's tried_restaurants" do
			user = FactoryGirl.create(:user)
			bad_restaurant = FactoryGirl.create(:restaurant)
			user.add_tried_restaurant(bad_restaurant)
			expect(Restaurant.not_tried_by(user).to_a).to eq([@restaurant])
		end
	end

	context "scope only_categories" do
		it "should only return restaurants which have any of the given categories" do
			category = FactoryGirl.create :category
			category.restaurants << @restaurant
			bad_restaurant = FactoryGirl.create :restaurant
			expect(Restaurant.only_categories([category.name]).to_a).to eq([@restaurant])
		end

		it "should return restaurants of any category if given an empty list" do
			category = FactoryGirl.create :category
			category.restaurants << @restaurant
			expect(Restaurant.only_categories([]).to_a).to eq([@restaurant])
		end
	end

	context "scope except_categories" do
		it "should return restaurants which don't have any of the given categories" do
			category = FactoryGirl.create :category
			bad_restaurant = FactoryGirl.create :restaurant
			category.restaurants << bad_restaurant
			expect(Restaurant.except_categories([category.name]).to_a).to eq([@restaurant])
		end

		it "should return restaurants of any category if given an empty list " do
			category = FactoryGirl.create :category
			category.restaurants << @restaurant
			expect(Restaurant.except_categories([]).to_a).to eq([@restaurant])
		end
	end

	context "scope order_by_reputation" do
		it "should return restaurants by descending sources count and recommendations count" do
			@restaurant.destroy
			restaurants = []
			(1..10).each do |n|
				restaurant = FactoryGirl.create(:restaurant)
				(1..n).each do |m|
					FactoryGirl.create(:recommendation, restaurant: restaurant)
				end
				restaurants.push restaurant
			end
			expect(Restaurant.order_by_reputation.to_a).to eq(restaurants.reverse)
		end
	end

	context "sources method" do
		it "should return the sources that belong to a restaurant" do
			expect(@restaurant.sources.count).to eq(1)
			expect{FactoryGirl.create :recommendation, :restaurant => @restaurant}
				.to change{@restaurant.sources.count}.by(1)
			expect{RecommendationGroup.all.each.map(&:destroy)}
				.to change{@restaurant.reload; @restaurant.sources.count}.to(0)
		end
	end
end
