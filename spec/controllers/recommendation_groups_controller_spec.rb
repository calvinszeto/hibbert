require 'rails_helper'

RSpec.describe RecommendationGroupsController, :type => :controller do
	before(:each) do
		@source = FactoryGirl.create :source
		(1..10).each do |n|
			FactoryGirl.create :recommendation_group, source: @source
		end
	end

  describe "GET index" do
		it "should return a list of recommendation groups that belong to the given source" do
			FactoryGirl.create :recommendation_group
			get :index, name: @source.name, format: :json
			expect(assigns(:recommendation_groups).to_a).to match_array(@source.recommendation_groups.to_a)
		end
  end

  describe "GET show" do
		it "should return the specified recommendation group with its recommendations" do
			rg = RecommendationGroup.take
			get :show, :id => rg.id, format: :json
			expect(assigns(:recommendation_group)).to eq(rg)
		end
  end
end
