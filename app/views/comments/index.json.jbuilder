json.array!(@comments) do |comment|
  json.extract! comment, :id, :score, :comment
  json.url comment_url(comment, format: :json)
end
