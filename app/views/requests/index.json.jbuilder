json.array!(@requests) do |request|
  json.extract! request, :id, :date, :type
  json.url request_url(request, format: :json)
end
