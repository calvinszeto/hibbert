class SourcesController < ApplicationController
	@@default_search_distance = 25 # MILES
	def self.default_search_distance
		@@default_search_distance
	end

  # GET /sources?format=json{&location&no_filter}
  def index
    @sources = Source.all
		@no_filter = params[:no_filter] == true
		@user = current_user
		unless current_user.nil? || @no_filter
			@sources = @sources.showable(current_user)
		end
		if params[:location]
			distance = params[:distance] || @@default_search_distance
			near_sources = Source.sources_near(@sources, params[:location], distance)
			@location = near_sources.empty? ? "error" : params[:location]
			@sources = near_sources unless near_sources.empty?
		else
			@sources.order(:name)
		end
		@sources
  end

  # GET /sources/1?format=json
  def show
		@source = Source.find(params[:id])
		@user = current_user
  end
end
