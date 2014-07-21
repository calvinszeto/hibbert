json.array!(@sources) do |source|
  json.extract! source, :id, :name, :category, :website, :description
	json.image source.default_image.image.url
	if @no_filter && @user
		json.no_show @user.no_show_sources.include?(source.id)
	end
	if @location
		if @location == "error"
			json.error "No sources have recommended restaurants near your location yet!"
		else
			json.extract! source, :nearby_restaurants_count
			json.searched_location @location
		end
	end
end
