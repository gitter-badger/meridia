json.array!(@prospects) do |prospect|
  json.extract! prospect, :id, :code, :name, :lastname, :phone, :mobile, :mail, :contact_type, :colonia, :delegacion, :status, :observation
  json.url prospect_url(prospect, format: :json)
end
