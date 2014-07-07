class RecommendationGroupsController < ApplicationController
  # GET /sources/:name?format=json
  def index
		@recommendation_groups = RecommendationGroup.find_by_source_name(params[:name])
  end

  # GET /sources/1?format=json
  def show
		@recommendation_group = RecommendationGroup.find(params[:id])
  end
end
