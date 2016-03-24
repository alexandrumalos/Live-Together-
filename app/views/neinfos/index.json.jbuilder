json.array!(@neinfos) do |neinfo|
  json.extract! neinfo, :id
  json.url neinfo_url(neinfo, format: :json)
end
