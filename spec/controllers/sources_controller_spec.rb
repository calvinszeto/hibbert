require 'rails_helper'

RSpec.describe SourcesController, :type => :controller do

  describe "GET index" do
		context "with user signed in" do
			it "should return sources with user preference attributes" do
				#source = Source.create! valid_attributes
				#get :index, {}, valid_session
				#expect(assigns(:sources)).to eq([source])
			end

			it "should filter by source preferences" do
			end

			context "with :no_filter=true" do
				it "should return sources without filtering on user preferences" do
				end
			end

			context "with :location param" do
				it "should add the location to user preferences" do
				end
			end

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

		context "with :location param" do
			it "should give preference with sources which recommend restaurants near the param"

			it "should return an error if param can't be geocoded" do
			end

			it "should return all restaurants if param can't be geocoded" do
			end
		end
	end

	describe "GET show" do
		it "should return the specified source object" do
			#source = Source.create! valid_attributes
			#get :show, {:id => source.to_param}, valid_session
			#expect(assigns(:source)).to eq(source)
		end

		context "with user signed in" do
			it "should return a source with user preference attributes" do
			end
		end

		context "without user signed in" do
			it "should return a source without user preference attributes" do
			end
		end
	end

	describe "PATCH update" do
		context "with :do_not_show param" do
			it "should update user do-not-show preferences" do
			end
		end
	end

end
