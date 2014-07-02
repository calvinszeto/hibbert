require 'rails_helper'

RSpec.describe RecommendationGroupController, :type => :controller do
  describe "GET index" do
		it "should return a list of recommendation groups that belong to the given source" do
		end
  end

  describe "GET show" do
		it "should return the specified recommendation group with its recommendations" do
      #source = Source.create! valid_attributes
      #get :show, {:id => source.to_param}, valid_session
      #expect(assigns(:source)).to eq(source)
		end
  end
end
