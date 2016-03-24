json.array!(@userprofiles) do |userprofile|
  json.extract! userprofile, :id
  json.url userprofile_url(userprofile, format: :json)
end
