require 'rails_helper'

RSpec.describe SourcesController, :type => :controller do

  describe "GET index" do
		context "with user signed in" do
			it "should return sources with user preference attributes"
				#source = Source.create! valid_attributes
				#get :index, {}, valid_session
				#expect(assigns(:sources)).to eq([source])

			it "should filter by source preferences"

			context "with :no_filter=true" do
				it "should return sources without filtering on user preferences"
			end

			context "with :location param" do
				it "should add the location to user preferences"
			end

			it "should give preference to recent locations"
		end

		context "without user signed in" do
			it "should return restaurants without user preference attributes"

			it "should return all restaurants by default"

			context "with :no_filter=true" do
				it "should return all restaurants by default"
			end
		end

		context "with :location param" do
			it "should give preference with sources which recommend restaurants near the param"

			it "should return an error if param can't be geocoded"

			it "should return all restaurants if param can't be geocoded"
		end
	end

	describe "GET show" do
		it "should return the specified source object"
			#source = Source.create! valid_attributes
			#get :show, {:id => source.to_param}, valid_session
			#expect(assigns(:source)).to eq(source)

		context "with user signed in" do
			it "should return a source with user preference attributes"
		end

		context "without user signed in" do
			it "should return a source without user preference attributes"
		end
	end

	describe "PATCH update" do
		context "with :do_not_show param" do
			it "should update user do-not-show preferences"
		end
	end

end
