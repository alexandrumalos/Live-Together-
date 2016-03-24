json.array!(@mainfeeds) do |mainfeed|
  json.extract! mainfeed, :id
  json.url mainfeed_url(mainfeed, format: :json)
end
