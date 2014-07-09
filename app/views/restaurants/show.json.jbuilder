json.extract! @restaurant, :id, :name, :website, :categories_list
if @user
	json.no_show @user.no_show_restaurants.include?(@restaurant.id)
	json.tried @user.tried_restaurants.include?(@restaurant.id)
end
json.sources @restaurant.sources do |source|
	json.name
	json.category
	json.website
	json.recommendation_groups(source.recommendation_groups
														 .joins(:recommendations)
														 .where(recommendations: 
																		{restaurant_id: @restaurant.id})
														 .order(date: :desc)
														 .limit(3))
end
