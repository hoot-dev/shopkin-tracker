json.array!(@shopkins) do |shopkin|
  json.extract! shopkin, :id, :name
  json.url shopkin_url(shopkin, format: :json)
end
