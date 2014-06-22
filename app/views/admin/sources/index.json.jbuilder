json.array!(@sources) do |source|
  json.extract! source, :id, :name, :category, :website
  json.url source_url(source, format: :json)
end
