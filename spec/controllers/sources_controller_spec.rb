require 'rails_helper'

# The following specs were written here but belong in view specs
#it "should return sources with user preference attributes"

#it "should return an error if param can't be geocoded"
#context "with user signed in" do
	#it "should return a source with user preference attributes"
#end

#context "without user signed in" do
	#it "should return a source without user preference attributes"
#end

RSpec.describe SourcesController, :type => :controller do

	before(:each) do
		@good_source = FactoryGirl.create(:source)
	end

  describe "GET index" do
		it "should assign no_filter param as no_filter" do
				get :index, no_filter: true, format: :json	
				expect(assigns(:no_filter)).to eq(true)
				get :index, no_filter: false, format: :json	
				expect(assigns(:no_filter)).to eq(false)
		end

		context "with user signed in" do
			before(:each) do
				@user = FactoryGirl.create(:user)
				sign_in @user
			end

			it "should assign current_user as user" do
				get :index, format: :json	
				expect(assigns(:user)).to eq(@user)
			end

			it "should filter by source preferences" do
				bad_source = FactoryGirl.create(:source)
				@user.add_no_show_source(bad_source)
				get :index, format: :json	
				expect(assigns(:sources).to_a).to match_array([@good_source])
			end

			context "with :no_filter=true" do
				it "should return sources without filtering on user preferences" do
					bad_source = FactoryGirl.create(:source)
					@user.add_no_show_source(bad_source)
					get :index, no_filter: true, format: :json	
					expect(assigns(:sources).to_a).to match_array(Source.all.to_a)
				end
			end
		end

		context "without user signed in" do
			it "should return all sources by default" do
				get :index, format: :json	
				expect(assigns(:sources).to_a).to match_array(Source.all.to_a)
			end

			context "with :no_filter=true" do
				it "should return all sources by default" do
					get :index, no_filter: true, format: :json	
					expect(assigns(:sources).to_a).to match_array(Source.all.to_a)
				end
			end
		end

		context "with :location param" do
			it "should return sources which recommend restaurants near the param" do
				allow_any_instance_of(Address).to receive(:geocode)
				near_restaurant = FactoryGirl.create :restaurant	
				FactoryGirl.create :address, :addressable => near_restaurant, 
					:distance  => SourcesController.default_search_distance - 1
				near_source = near_restaurant.sources.first
				FactoryGirl.create :address, :addressable => FactoryGirl.create(:restaurant),
					:distance => SourcesController.default_search_distance + 1 
				# TODO: remove hard numbers
				get :index, location: [20, 20], format: :json	
				expect(assigns(:sources).to_a).to match_array([near_source])
			end
		end
	end

	describe "GET show" do
		it "should return the specified source object" do
			get :show, :id => @good_source.id, format: :json
			expect(assigns(:source)).to eq(@good_source)
		end

		context "with user signed in" do
			it "should assign current_user as user" do
				user = FactoryGirl.create :user
				sign_in user
				get :show, :id => @good_source.id, format: :json
				expect(assigns(:user)).to eq(user)
			end
		end
	end
end
