json.array!(@messengers) do |messenger|
  json.extract! messenger, :id, :text, :subjet, :status
  json.url messenger_url(messenger, format: :json)
end
