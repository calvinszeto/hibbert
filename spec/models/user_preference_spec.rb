# == Schema Information
#
# Table name: user_preferences
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  no_show_sources     :integer          default([]), is an Array
#  no_show_restaurants :integer          default([]), is an Array
#  tried_restaurants   :integer          default([]), is an Array
#  created_at          :datetime
#  updated_at          :datetime
#

require 'rails_helper'

RSpec.describe UserPreference, :type => :model do
	before(:each) do
		@user_preference = FactoryGirl.create :user_preference
	end

	context "add_no_show_source" do
		it "should add a source to no_show_sources and save" do
			source = FactoryGirl.create :source
			expect {
				@user_preference.add_no_show_source(source)
			}.to change{@user_preference.no_show_sources}.from([]).to([source.id])
		end
	end

	context "remove_no_show_source" do
		it "should remove a source from  no_show_sources and save" do
			source = FactoryGirl.create :source
			@user_preference.add_no_show_source(source)
			expect {
				@user_preference.remove_no_show_source(source)
			}.to change{@user_preference.no_show_sources}.from([source.id]).to([])
		end
	end

	context "add_no_show_restaurant" do
		it "should add a restaurant to no_show_restaurants and save" do
			restaurant = FactoryGirl.create :restaurant
			expect {
				@user_preference.add_no_show_restaurant(restaurant)
			}.to change{@user_preference.no_show_restaurants}.from([]).to([restaurant.id])
		end
	end

	context "remove_no_show_restaurant" do
		it "should remove a restaurant from  no_show_restaurants and save" do
			restaurant = FactoryGirl.create :restaurant
			@user_preference.add_no_show_restaurant(restaurant)
			expect {
				@user_preference.remove_no_show_restaurant(restaurant)
			}.to change{@user_preference.no_show_restaurants}.from([restaurant.id]).to([])
		end
	end

	context "add_tried_restaurant" do
		it "should add a restaurant to tried_restaurants and save" do
			restaurant = FactoryGirl.create :restaurant
			expect {
				@user_preference.add_tried_restaurant(restaurant)
			}.to change{@user_preference.tried_restaurants}.from([]).to([restaurant.id])
		end
	end

	context "remove_tried_restaurant" do
		it "should remove a restaurant from  tried_restaurants and save" do
			restaurant = FactoryGirl.create :restaurant
			@user_preference.add_tried_restaurant(restaurant)
			expect {
				@user_preference.remove_tried_restaurant(restaurant)
			}.to change{@user_preference.tried_restaurants}.from([restaurant.id]).to([])
		end
	end
end
