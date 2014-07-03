class RestaurantsController < ApplicationController
  # GET /restaurants?format=json{&only&except&location&tried&no_filter}
  def index
    @restaurants = Restaurant.all
		unless params[:tried]
			@restaurants = @restaurants.not_tried_by(current_user)
		end
		unless params[:no_filter]
			@restaurants = @restaurants.showable(current_user)
			
			# Until I figure out how to do this via queries, keep this last
			@restaurants = @restaurants.to_a.keep_if{|r| r.source_showable(current_user)}
		end
  end

  # GET /restaurants/1?format=json
  def show
		@restaurant = Restaurant.find(params[:id])
  end

	# PATCH /restaurants/1
	def update
	end
end
