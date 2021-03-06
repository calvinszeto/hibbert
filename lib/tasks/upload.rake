
def filter_hash(hash, params)
	new_hash = {}
	unless params[:required].nil?
		params[:required].each do |arg|
			unless hash.has_key? arg
				raise "Hash is missing #{arg}"
			end
			new_hash[arg] = hash[arg]
		end
	end
	unless params[:optional].nil?
		params[:optional].each do |arg|
			if hash.has_key? arg
				new_hash[arg] = hash[arg]
			end
		end
	end
	new_hash
end

def same_restaurants(restaurant_params, address_params)
	Restaurant.where(:name => restaurant_params['name'])
						.joins(:addresses)
						.where(addresses: {city: address_params['city']})
end

namespace :upload do
	desc "Upload Restaurants and Recommendations for a single Source"
	task :recommendations => :environment do
		require 'indirizzo'
		# Example of a valid input:
		# Names are the only required fields, but all others are highly recommended,
		# especially Restaurant Address
		# [{"name": "Source Name", 
		# "category": "Source Category", 
		# "website": "Source Website", 
		# "description": "Source Description",
		#		"recommendation_group": 
		#			{"name": "RecommendationGroup Name", 
		#			"website": "RecommendationGroup Website", 
		#			"date": "RecommendationGroup Date", 
		#			"description": "RecommendationGroup Description",
			#		"recommendations": [
			#			{"name": "Restaurant Name",
			#			"website": "Restaurant Website",
			#			"address": "Restaurant Address"
			#			},
		#			...}
		#		]
		#	},
		#	...
		#	]

		if ENV['UPLOAD_FILE'].empty?
			abort "Specify a JSON file in ENV['UPLOAD_FILE']"
		else
			begin
				data = JSON.parse(IO.read(ENV['UPLOAD_FILE']))
			rescue
				abort "#{ENV['UPLOAD_FILE']} is an invalid file."
			end
			scope = "Source"
			begin
				data.each do |dat|
					source_params = filter_hash(dat, :required => ['name'], :optional => ['category', 'website', 'description'])
					if (sources = Source.where(:name => source_params['name'])).empty?
						source = Source.create(source_params)
						puts "Created new Source: #{source['name']}"
					else
						source = sources.first
						source.update_attributes(source_params)
						source.save!
						puts "Updated Sources: #{source['name']}"
					end

					scope = "Recommendation Group"
					recommendation_group_params = filter_hash(dat['recommendation_group'],
						:required => ['name'], :optional => ['name', 'website', 'date', 'description'])
					recommendation_group_params[:source] = source
					if (groups = RecommendationGroup.where(:name => recommendation_group_params['name'], :source => source)).empty?
						rg = RecommendationGroup.create(recommendation_group_params)
						puts "Created new RecommendationGroup: #{rg['name']}"
					else
						rg = groups.first
						rg.update_attributes(recommendation_group_params)
						rg.save!
						puts "Updated RecommendationGroup: #{rg['name']}"
					end

					dat['recommendation_group']['recommendations'].each do |rec|
						scope = "Restaurants"

						restaurant_params = filter_hash(rec, :required => ['name'], :optional => ['name', 'website'])
						address_params = filter_hash(rec, :required => [], :optional => ['address'])

						unless address_params['address'].empty?
							scope = "Address"
							adr = Indirizzo::Address.new(address_params['address'])
							address_params['street'] = "#{adr.number} #{adr.street.first}"
							address_params['city'] = adr.city.first
							address_params['state'] = adr.state
							address_params['zip_code'] = adr.zip
							address_params['address_text'] = address_params['address']
							address_params.delete 'address'
							address = Address.create(address_params)
							sleep(0.2) # Google limits requests to 5 per second
						end
						
						# Checking for restaurants with the same name in the same city
						if (restaurants = same_restaurants(restaurant_params, address_params)).empty?
							restaurant = Restaurant.create(restaurant_params)
							puts "Created new Restaurant: #{restaurant['name']}"
						else
							restaurant = restaurants.first
							restaurant.update_attributes(restaurant_params)
							restaurant.save!
							puts "Updated Restaurant: #{restaurant['name']}"
						end

						address.update_attributes(:addressable => restaurant) if address

						if Recommendation.where(:restaurant => restaurant, :recommendation_group => rg).empty?
							Recommendation.create(:restaurant => restaurant, :recommendation_group => rg)
							puts "Recommendation created."
						else
							puts "Recommendation already exists."
						end
					end
				end
			rescue Exception => e
				abort "Invalid format of #{scope}. See the comments in lib/tasks/upload.rake.\nError Message: #{e.message}"
			end
		end
	end

	desc "Upload a list of categories and default images"
	task :categories => :environment do
		# Example of a valid input:
		# [{"name": "Category Name",
		#		"image_location": "Image Location (in local files)"},
		#		...
		# ]
		unless ENV['UPLOAD_FILE']
			abort "Specify a JSON file in ENV['UPLOAD_FILE']"
		else
			begin
				data = JSON.parse(IO.read(ENV['UPLOAD_FILE']))
			rescue
				abort "#{ENV['UPLOAD_FILE']} is an invalid file."
			end
			scope = "Category"
			begin
				data.each do |category|
					category_params = filter_hash(category, :required => ['name'])
					image_params = filter_hash(category, :optional => ['image_location'])
					if image_params
						scope = "Image"
						image = Image.new
						image.image = File.open(image_params['image_location'])
						image.save!
						puts "Uploaded new Image: #{image.image.identifier}"
					end
					scope = "Category"
					if (categories = Category.where(:name => category_params['name'])).empty?
						category = Category.create(:name => category['name'])
						image.imageable = category
						image.save!
						puts "Created new Category: #{category['name']}"
					else
						category = categories.first
						image.imageable = category
						image.save!
						puts "Updated Category: #{category['name']}"
					end
				end
			rescue Exception => e
				abort "Invalid format of #{scope}. See the comments in lib/tasks/upload.rake.\nError Message: #{e.message}"
			end
		end
	end

end
