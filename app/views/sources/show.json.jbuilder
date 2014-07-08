json.extract! @source, :id, :name, :category, :website, :description
json.recommendation_groups @source.recommendation_groups do |rg|
	json.name rg.name
	json.date rg.date
	json.recommendations_count rg.recommendations.count
end
