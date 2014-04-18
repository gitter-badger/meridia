json.array!(@members) do |member|
  json.extract! member, :id, :name, :addres, :phone, :age, :code, :status
  json.url member_url(member, format: :json)
end
