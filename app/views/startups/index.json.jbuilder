json.array!(@startups) do |startup|
  json.extract! startup, :id, :name, :startup_id, :description, :photo, :no_votes
  json.url startup_url(startup, format: :json)
end
