json.array!(@uploads) do |upload|
  json.extract! upload.to_jq_upload, "name", "size", "url", "delete_url", "delete_type", "title"
end
