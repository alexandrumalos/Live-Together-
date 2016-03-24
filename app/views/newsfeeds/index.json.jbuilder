json.array!(@newsfeeds) do |newsfeed|
  json.extract! newsfeed, :id
  json.url newsfeed_url(newsfeed, format: :json)
end
