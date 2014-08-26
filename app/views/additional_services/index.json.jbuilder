json.array!(@additional_services) do |additional_service|
  json.extract! additional_service, :id, :name, :price, :description
  json.url additional_service_url(additional_service, format: :json)
end
