json.extract! @restaurant, :id, :name, :website, :categories_list
json.address @restaurant.full_address
if @user
	json.no_show @user.no_show_restaurants.include?(@restaurant.id)
	json.tried @user.tried_restaurants.include?(@restaurant.id)
end
json.sources @restaurant.sources do |source|
	json.name source.name
	json.category source.category
	json.website source.website
	json.recommendation_groups(source.recommendation_groups
														 .joins(:recommendations)
														 .where(recommendations: 
																		{restaurant_id: @restaurant.id})
														 .order(date: :desc)
														 .select('recommendation_groups.id, 
																		 recommendation_groups.name')
														 .limit(3))
end
