json.array!(@users) do |user|
  json.extract! user, :id, :username, :password, :email, :name, :isNewser
  json.url user_url(user, format: :json)
end
