json.array!(@recommendations) do |recommendation|
  json.extract! recommendation, :id, :restaurant_id, :source_id, :date_recommended, :website
  json.url recommendation_url(recommendation, format: :json)
end
