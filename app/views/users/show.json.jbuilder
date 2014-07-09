json.extract! @user, :id, :email
json.no_show_sources Source.where(id: @user.no_show_sources) do |source|
	json.extract! source, :id, :name
end
json.no_show_restaurants Restaurant.where(id: @user.no_show_restaurants) do |restaurant|
	json.extract! restaurant, :id, :name
end
json.tried_restaurants Restaurant.where(id: @user.tried_restaurants) do |restaurant|
	json.extract! restaurant, :id, :name
end
