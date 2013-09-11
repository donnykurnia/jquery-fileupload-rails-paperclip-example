json.array!(@prompts) do |prompt|
  json.extract! prompt, :uuid
  json.url prompt_url(prompt, format: :json)
end
