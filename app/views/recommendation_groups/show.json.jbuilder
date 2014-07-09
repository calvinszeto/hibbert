json.extract! @recommendation_group, :id, :name, :website, :date, :description, :source_id
json.source_name @recommendation_group.source.name
json.recommendations @recommendation_group.recommendations do |rec|
	json.restaurant_id rec.restaurant_id
	json.restaurant_name rec.restaurant.name
	json.restaurant_categories rec.restaurant.categories_list
	if @user
		json.tried_restaurant @user.tried_restaurants.include?(rec.restaurant.id)
		json.no_show_restaurant @user.no_show_restaurants.include?(rec.restaurant.id)
	end
end
