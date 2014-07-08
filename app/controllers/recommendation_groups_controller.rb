class RecommendationGroupsController < ApplicationController
  # GET /recommendation_groups_for/:name?format=json
  def index
		@recommendation_groups = RecommendationGroup.find_by_source_name(params[:name])
  end

  # GET /recommendation_groups/1?format=json
  def show
		@recommendation_group = RecommendationGroup.find(params[:id])
  end
end
