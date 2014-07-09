require 'rails_helper'

RSpec.describe RecommendationGroupsController, :type => :controller do
	before(:each) do
		@source = FactoryGirl.create :source
		(1..10).each do |n|
			FactoryGirl.create :recommendation_group, source: @source
		end
	end

  describe "GET show" do
		it "should return the specified recommendation group with its recommendations" do
			rg = RecommendationGroup.take
			get :show, :id => rg.id, format: :json
			expect(assigns(:recommendation_group)).to eq(rg)
		end

		it "should assign current_user as user" do
			rg = RecommendationGroup.take
			get :show, :id => rg.id, format: :json
			expect(assigns(:user)).to be_nil
			user = FactoryGirl.create :user
			sign_in user
			get :show, :id => rg.id, format: :json
			expect(assigns(:user)).to eq(user)
		end
  end
end
