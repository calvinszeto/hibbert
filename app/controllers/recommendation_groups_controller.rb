class RecommendationGroupsController < ApplicationController
  # GET /recommendation_groups/1?format=json
  def show
		@user = current_user
		@recommendation_group = RecommendationGroup.find(params[:id])
  end
end
