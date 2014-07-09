json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :website
	if @no_filter && @user
		json.no_show @user.no_show_restaurants.include?(restaurant.id)
	end
	if @tried && @user
		json.tried @user.tried_restaurants.include?(restaurant.id)
	end
	if @location
		if @location == "error"
			json.error "No restaurants were found near your location!"
		else
			json.extract! restaurant, :distance
			json.searched_location @location
		end
	end
end
