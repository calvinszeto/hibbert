class RestaurantsController < ApplicationController
  # GET /restaurants?format=json{&only&except&location&tried&no_filter}
  def index
    @restaurants = Restaurant.all
  end

  # GET /restaurants/1?format=json
  def show
      @restaurant = Restaurant.find(params[:id])
  end

	# PATCH /restaurants/1
	def update
	end
end
