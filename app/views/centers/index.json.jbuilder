json.array!(@centers) do |center|
  json.extract! center, :id, :name, :address, :phone
  json.url center_url(center, format: :json)
end
