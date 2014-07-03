require 'rails_helper'

RSpec.describe RestaurantsController, :type => :controller do

	before(:each) do
		(1..10).each {FactoryGirl.create(:restaurant)}
		@restaurants = Restaurant.all
		@restaurant = @restaurants.first
	end

  describe "GET index" do
		context "with user signed in" do
			before(:each) do
				@user = FactoryGirl.create(:user)
				sign_in @user
			end

			it "should return restaurants with user preference attributes" do
			end

			it "should filter by source preferences" do
				get :index, format: :json	
				expect(assigns(:restaurants)).to eq(@restaurants)
			end

			it "should filter by restaurant preferences" do
			end

			it "should filter out tried restaurants by default" do
			end

			context "with :tried=false" do
				it "should not filter out tried restaurants" do
				end
			end

			context "with :no_filter=true" do
				it "should return restaurants without filtering on user preferences" do
				end
			end

			context "with :only param" do
				it "should add the categories to user preferences" do
				end
			end

			context "with :except param" do
				it "should add the categories to user preferences" do
				end
			end

			context "with :location param" do
				it "should add the location to user preferences" do
				end
			end

			it "should give preference to recent categories"

			it "should give preference to recent locations"
		end

		context "without user signed in" do
			it "should return restaurants without user preference attributes" do
			end

			it "should return all restaurants by default" do
			end

			context "with :no_filter=true" do
				it "should return all restaurants by default" do
				end
			end
		end

		context "with :only param" do
			it "should return all categories if param is empty" do
			end

			it "should return only restaurants whose category matches the param" do
			end
		end

		context "with :except param" do
			it "should return all categories if param is empty" do
			end

			it "should filter out restaurants whose category matches the param" do
			end
		end

		context "with :location param" do
			it "should return restaurants with a distance attribute" do
			end

			it "should return restaurants ordered by distance from the param" do
			end

			it "should return an error if param can't be geocoded" do
			end	

			it "should return all restaurants if param can't be geocoded" do
			end
		end
  end

  describe "GET show" do
		it "should return the specified restaurant object" do
      #restaurant = Restaurant.create! valid_attributes
      #get :show, {:id => restaurant.to_param}, valid_session
      #expect(assigns(:restaurant)).to eq(restaurant)
		end

		context "with user signed in" do
			it "should return a restaurant with user preference attributes" do
			end
		end

		context "without user signed in" do
			it "should return a restaurant without user preference attributes" do
			end
		end
  end

	describe "PATCH update" do
		context "with :tried param" do
			it "should update user tried preferences" do
			end
		end

		context "with :do_not_show param" do
			it "should update user do-not-show preferences" do
			end
		end
	end

end
