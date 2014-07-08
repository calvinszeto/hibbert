class RestaurantsController < ApplicationController
	@@default_search_distance = 25 # MILES
	def self.default_search_distance
		@@default_search_distance
	end

  # GET /restaurants?format=json{&only&except&location&tried&no_filter}
  def index
    @restaurants = Restaurant.all
		if params[:only]
			@restaurants = @restaurants.only_categories(params[:only])
		end
		if params[:except]
			@restaurants = @restaurants.except_categories(params[:except])
		end
		unless current_user.nil?
			unless params[:tried]
				@restaurants = @restaurants.not_tried_by(current_user)
			end
			unless params[:no_filter]
				@restaurants = @restaurants.showable(current_user)
				@restaurants = @restaurants.source_showable(current_user)
			end
		end
		if params[:location]
			distance = params[:distance] || @@default_search_distance
			near_restaurants = Restaurant.near(@restaurants, params[:location], distance)
			@restaurants = near_restaurants unless near_restaurants.empty?
		else
			@restaurants = @restaurants.order_by_reputation
		end
		@restaurants
  end

  # GET /restaurants/1?format=json
  def show
		@restaurant = Restaurant.find(params[:id])
  end
end
