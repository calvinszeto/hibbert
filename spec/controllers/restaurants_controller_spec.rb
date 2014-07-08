require 'rails_helper'

# The following specs were written here but belong in view specs
#it "should return restaurants with user preference attributes"

#it "should return a restaurant without user preference attributes"

#it "should return restaurants with a distance attribute"

#it "should return an error if param can't be geocoded"

#it "should return all restaurants if param can't be geocoded"

# The following specs were written here but should be in the user controller
#describe "PATCH update" do
	#context "with :tried param" do
		#it "should update user tried preferences"
	#end

	#context "with :do_not_show param" do
		#it "should update user do-not-show preferences"
	#end
#end

RSpec.describe RestaurantsController, :type => :controller do

	before(:each) do
		@good_restaurant = FactoryGirl.create(:restaurant)
	end

  describe "GET index" do
		context "with user signed in" do
			before(:each) do
				@user = FactoryGirl.create(:user)
				sign_in @user
			end

			it "should filter by source preferences" do
				bad_restaurant = FactoryGirl.create(:restaurant)
				recommendation = bad_restaurant.recommendations.first
				@user.add_no_show_source(recommendation.source)
				get :index, format: :json	
				expect(assigns(:restaurants).to_a).to match_array([@good_restaurant])
			end

			it "should filter by restaurant preferences" do
				bad_restaurant = FactoryGirl.create(:restaurant)
				@user.add_no_show_restaurant(bad_restaurant)
				get :index, format: :json	
				expect(assigns(:restaurants).to_a).to match_array([@good_restaurant])
			end

			it "should filter out tried restaurants by default" do
				tried_restaurant = FactoryGirl.create(:restaurant)
				@user.add_tried_restaurant(tried_restaurant)
				get :index, format: :json
				expect(assigns(:restaurants).to_a).to match_array([@good_restaurant])
			end

			context "with :tried=false" do
				it "should not filter out tried restaurants" do
					tried_restaurant = FactoryGirl.create(:restaurant)
					@user.add_tried_restaurant(tried_restaurant)
					get :index, tried: true, format: :json
					expect(assigns(:restaurants).to_a).to match_array(Restaurant.all.to_a)
				end
			end

			context "with :no_filter=true" do
				it "should return restaurants without filtering on user preferences" do
					bad_restaurant_one = FactoryGirl.create(:restaurant)
					recommendation = bad_restaurant_one.recommendations.first
					bad_restaurant_two = FactoryGirl.create(:restaurant)
					@user.add_no_show_source(recommendation.source)
					@user.add_no_show_restaurant(bad_restaurant_two)
					get :index, no_filter: true, format: :json	
					expect(assigns(:restaurants).to_a).to match_array(Restaurant.all.to_a)
				end
			end
		end

		context "without user signed in" do
			it "should return all restaurants by default" do
				get :index, format: :json	
				expect(assigns(:restaurants).to_a).to match_array(Restaurant.all.to_a)
			end

			context "with :no_filter=true" do
				it "should return all restaurants by default" do
					get :index, no_filter: true, format: :json	
					expect(assigns(:restaurants).to_a).to match_array(Restaurant.all.to_a)
				end
			end
		end

		context "with :only param" do
			before(:each) do
				bad_restaurant = FactoryGirl.create :restaurant
			end

			it "should return all categories if param is empty" do
				get :index, format: :json	
				expect(assigns(:restaurants).to_a).to match_array(Restaurant.all.to_a)
			end

			it "should return only restaurants whose category matches the param" do
				good_category = @good_restaurant.categories.first
				get :index, :only => [good_category.name], format: :json	
				expect(assigns(:restaurants).to_a).to match_array([@good_restaurant])
			end
		end

		context "with :except param" do
			before(:each) do
				@bad_restaurant = FactoryGirl.create :restaurant
				@bad_category = FactoryGirl.create :category
				@bad_restaurant.categories << @bad_category
			end

			it "should return all categories if param is empty" do
				get :index, format: :json	
				expect(assigns(:restaurants).to_a).to match_array(Restaurant.all.to_a)
			end

			it "should filter out restaurants whose category matches the param" do
				get :index, :except => [@bad_category.name], format: :json	
				expect(assigns(:restaurants).to_a).to match_array([@good_restaurant])
			end
		end

		context "with :location param" do
			before(:each) do
				allow_any_instance_of(Address).to receive(:geocode)
				@near_restaurant = FactoryGirl.create :restaurant	
				FactoryGirl.create :address, :addressable => @good_restaurant
			end

			it "should return restaurants within the default search distance" do
				FactoryGirl.create :address, :addressable => @near_restaurant, 
					:distance  => RestaurantsController.default_search_distance - 1
				FactoryGirl.create :address, :addressable => FactoryGirl.create(:restaurant),
					:distance => RestaurantsController.default_search_distance + 1 
				get :index, location: [@good_restaurant.latitude, @good_restaurant.longitude], format: :json	
				expect(assigns(:restaurants).to_a).to match_array([@good_restaurant, @near_restaurant])
			end
			
			it "should return restaurants ordered by distance from the param" do
				restaurants = [@good_restaurant]
				(1..10).each do |n|
					restaurant = FactoryGirl.create(:restaurant)
					FactoryGirl.create :address, :addressable => restaurant, :distance => n
					restaurants.push restaurant
				end
				get :index, location: [@good_restaurant.latitude, @good_restaurant.longitude], format: :json	
				expect(assigns(:restaurants).to_a).to eq(restaurants)
			end

			it "should return all restaurants if no results are found" do
				get :index, location: [0,0], format: :json
				expect(assigns(:restaurants).to_a).to match_array(Restaurant.all.to_a)
			end

			context "with :distance param" do
				it "should return restaurants within the provided distance" do
					FactoryGirl.create :address, :addressable => @good_restaurant
					@near_restaurant = FactoryGirl.create :restaurant	
					distance = RestaurantsController.default_search_distance * 2
					FactoryGirl.create :address, :addressable => @near_restaurant, 
						:distance  => distance - 1
					FactoryGirl.create :address, :addressable => FactoryGirl.create(:restaurant),
						:distance => distance + 1
					get :index, location: [@good_restaurant.latitude, @good_restaurant.longitude], distance: distance, format: :json	
					expect(assigns(:restaurants).to_a).to match_array([@good_restaurant, @near_restaurant])
				end
			end
		end

		context "without :location param" do
			it "should return restaurants ordered by sources count and recommendation count" do
				@good_restaurant.destroy
				restaurants = []
				(1..10).each do |n|
					restaurant = FactoryGirl.create(:restaurant)
					(1..n).each do |m|
						FactoryGirl.create(:recommendation, restaurant: restaurant)
					end
					restaurants.push restaurant
				end
				get :index, format: :json
				expect(assigns(:restaurants).to_a).to eq(restaurants.reverse)
			end
		end
  end

  describe "GET show" do
		it "should return the specified restaurant object" do
			get :show, :id => @good_restaurant.id, format: :json
			expect(assigns(:restaurant)).to eq(@good_restaurant)
		end
  end
end
