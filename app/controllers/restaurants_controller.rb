class RestaurantsController < ApplicationController
	@@default_search_distance = 25 # MILES
	def self.default_search_distance
		@@default_search_distance
	end

  # GET /restaurants?format=json{&only&except&location&tried&no_filter&page&per_page}
  def index
    @restaurants = Restaurant.all
		@no_filter = params[:no_filter] == "true"
		@tried = params[:tried] == "true"
		@user = current_user
		if params[:only]
			@restaurants = @restaurants.only_categories(params[:only])
		end
		if params[:except]
			@restaurants = @restaurants.except_categories(params[:except])
		end
		unless current_user.nil?
			unless @tried 
				@restaurants = @restaurants.not_tried_by(current_user)
			end
			unless @no_filter 
				@restaurants = @restaurants.showable(current_user)
				@restaurants = @restaurants.source_showable(current_user)
			end
		end
		located = false
		if params[:location] && !params[:location].empty?
			distance = params[:distance] || @@default_search_distance
			near_restaurants = Restaurant.near(@restaurants, params[:location], distance)
			@location = near_restaurants.empty? ? "error" : params[:location]
			@restaurants = near_restaurants unless near_restaurants.empty?
			# TODO: Hack to fix pagination in address search. Refactor and test
			if params[:page] && params[:per_page]
				start = (params[:page].to_i * params[:per_page].to_i)
				@restaurants = @restaurants[start..(start + params[:per_page].to_i + 1)]
			end
			located = !near_restaurants.empty?
		end
		if !located	
			@restaurants = @restaurants.order_by_reputation
			if params[:page] && params[:per_page]
				@restaurants = @restaurants.offset(params[:page].to_i * params[:per_page].to_i).limit(params[:per_page].to_i)
			end
		end
		@restaurants
  end

  # GET /restaurants/1?format=json
  def show
		@restaurant = Restaurant.find(params[:id])
		@user = current_user
  end
end
