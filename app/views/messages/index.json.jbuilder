json.array!(@messages) do |message|
  json.extract! message, :id, : text, :head
  json.url message_url(message, format: :json)
end
