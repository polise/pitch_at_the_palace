json.array!(@voters) do |voter|
  json.extract! voter, :id, :name, :voter_type, :voter_id
  json.url voter_url(voter, format: :json)
end
