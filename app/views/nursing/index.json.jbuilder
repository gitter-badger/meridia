json.array!(@vigs) do |vig|
  json.extract! vig, :id, :name, :date
  json.url vig_url(vig, format: :json)
end
