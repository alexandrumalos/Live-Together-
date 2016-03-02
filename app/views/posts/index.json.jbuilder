json.array!(@posts) do |post|
  json.extract! post, :id, :post, :score
  json.url post_url(post, format: :json)
end
