json.array!(@families) do |family|
  json.extract! family, :id, :firstname, :lastname, :relationship, :phone_home, :address, :phone_mobile
  json.url family_url(family, format: :json)
end
