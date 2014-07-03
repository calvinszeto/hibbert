require 'rails_helper'

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
				recommendation = FactoryGirl.create(:recommendation,
																						:restaurant => bad_restaurant)	
				@user.add_no_show_source(recommendation.source)
				get :index, format: :json	
				expect(assigns(:restaurants).to_a).to eq([@good_restaurant])
			end

			it "should filter by restaurant preferences" do
				bad_restaurant = FactoryGirl.create(:restaurant)
				@user.add_no_show_restaurant(bad_restaurant)
				get :index, format: :json	
				expect(assigns(:restaurants).to_a).to eq([@good_restaurant])
			end

			it "should filter out tried restaurants by default" do
				tried_restaurant = FactoryGirl.create(:restaurant)
				@user.add_tried_restaurant(tried_restaurant)
				get :index, format: :json
				expect(assigns(:restaurants).to_a).to eq([@good_restaurant])
			end

			context "with :tried=false" do
				it "should not filter out tried restaurants" do
					tried_restaurant = FactoryGirl.create(:restaurant)
					@user.add_tried_restaurant(tried_restaurant)
					get :index, tried: true, format: :json
					expect(assigns(:restaurants).to_a).to eq(Restaurant.all.to_a)
				end
			end

			context "with :no_filter=true" do
				it "should return restaurants without filtering on user preferences" do
				bad_restaurant_one = FactoryGirl.create(:restaurant)
				recommendation = FactoryGirl.create(:recommendation,
																						:restaurant => bad_restaurant_one)	
				bad_restaurant_two = FactoryGirl.create(:restaurant)
				@user.add_no_show_source(recommendation.source)
				@user.add_no_show_restaurant(bad_restaurant_two)
				get :index, no_filter: true, format: :json	
				expect(assigns(:restaurants).to_a).to eq(Restaurant.all.to_a)
				end
			end
		end

		context "without user signed in" do
			it "should return all restaurants by default" do
				get :index, format: :json	
				expect(assigns(:restaurants).to_a).to eq(Restaurant.all.to_a)
			end

			context "with :no_filter=true" do
				it "should return all restaurants by default" do
					get :index, no_filter: true, format: :json	
					expect(assigns(:restaurants).to_a).to eq(Restaurant.all.to_a)
				end
			end
		end

		context "with :only param" do
			it "should return all categories if param is empty"

			it "should return only restaurants whose category matches the param"
		end

		context "with :except param" do
			it "should return all categories if param is empty"

			it "should filter out restaurants whose category matches the param"
		end

		context "with :location param" do
			it "should return restaurants with a distance attribute"

			it "should return restaurants ordered by distance from the param"

			it "should return an error if param can't be geocoded"

			it "should return all restaurants if param can't be geocoded"
		end
  end

  describe "GET show" do
		it "should return the specified restaurant object"
      #restaurant = Restaurant.create! valid_attributes
      #get :show, {:id => restaurant.to_param}, valid_session
      #expect(assigns(:restaurant)).to eq(restaurant)

		context "with user signed in" do
			it "should return a restaurant with user preference attributes"
		end

		context "without user signed in" do
			it "should return a restaurant without user preference attributes"
		end
  end

	describe "PATCH update" do
		context "with :tried param" do
			it "should update user tried preferences"
		end

		context "with :do_not_show param" do
			it "should update user do-not-show preferences"
		end
	end

end
