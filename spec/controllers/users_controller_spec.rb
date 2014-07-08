require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

	before(:each) do
		@user = FactoryGirl.create :user
	end

  describe "GET show" do
		context "with user signed-in" do
			it "returns a user object for the currently-signed-in user" do
				sign_in @user
				get :show, format: :json
				expect(assigns(:user)).to eq(@user)
			end
		end

		context "without user signed-in" do
			it "returns a 401 response" do
				get :show, format: :json
				expect(response.status).to eq(401)
			end
		end
  end

  describe "POST create" do
    context "with valid params" do
      it "creates a new User" do
				attr = {:email => "ok.ok@ok.ok",
						:password => "okokokok",
						:password_confirmation => "okokokok"}
				expect {
					post :create, :user => attr, format: :json
				}.to change(User, :count).by(1)
			end
    end

    context "with invalid params" do
			it "responds with an error" do
				attr = {:email => "ok.ok@ok.ok",
						:password => "short",
						:password_confirmation => "short"}
				post :create, :user => attr, format: :json
				expect(response.status).to eq(422)
			end
    end
  end

  describe "PATCH update" do
		before(:each) do
			sign_in @user
		end

		context "with :no_show_source param" do
			before(:each) do
				@source = FactoryGirl.create :source
			end

			context "with :operation=add" do
				it "should add the source to the current user's no_show_sources" do
					patch :update, :operation => "add", :no_show_source => @source.id, format: :json
					@user.reload
					expect(@user.no_show_sources).to match_array([@source.id])
				end
			end

			context "with :operation=remove" do
				it "should remove the source from the current user's no_show_sources" do
					@user.add_no_show_source(@source)
					patch :update, :operation => "remove", :no_show_source => @source.id, format: :json
					@user.reload
					expect(@user.no_show_sources).to match_array([])
				end
			end
		end

		context "with :no_show_restaurant param" do
			before(:each) do
				@restaurant = FactoryGirl.create :restaurant
			end

			context "with :operation=add" do
				it "should add the restaurant to the current user's no_show_restaurants" do
					patch :update, :operation => "add", :no_show_restaurant => @restaurant.id, format: :json
					@user.reload
					expect(@user.no_show_restaurants).to match_array([@restaurant.id])
				end
			end

			context "with :operation=remove" do
				it "should remove the restaurant from the current user's no_show_restaurants" do
					@user.add_no_show_restaurant(@restaurant)
					patch :update, :operation => "remove", :no_show_restaurant => @restaurant.id, format: :json
					@user.reload
					expect(@user.no_show_restaurants).to match_array([])
				end
			end
		end

		context "with :tried_restaurant param" do
			before(:each) do
				@restaurant = FactoryGirl.create :restaurant
			end

			context "with :operation=add" do
				it "should add the restaurant to the current user's tried_restaurants" do
					patch :update, :operation => "add", :tried_restaurant => @restaurant.id, format: :json
					@user.reload
					expect(@user.tried_restaurants).to match_array([@restaurant.id])
				end
			end

			context "with :operation=remove" do
				it "should remove the restaurant from the current user's tried_restaurants" do
					@user.add_tried_restaurant(@restaurant)
					patch :update, :operation => "remove", :tried_restaurant => @restaurant.id, format: :json
					@user.reload
					expect(@user.tried_restaurants).to match_array([])
				end
			end
		end

		context "with no params" do
			it "should not change any of the user's preferences" do
				patch :update, format: :json	
				@user.reload
				expect(@user.no_show_sources).to match_array([])
				expect(@user.no_show_restaurants).to match_array([])
				expect(@user.tried_restaurants).to match_array([])
			end
		end
  end

  describe "DELETE destroy" do
    it "destroys the requested user" do
			sign_in @user
			expect {
				delete :destroy, format: :json
			}.to change{User.count}.by(-1)
		end
  end
end
