json.array!(@activities) do |activity|
  json.extract! activity, :id, :title, :body, :participants, :area, :adjetive, :physical_level, :social_level, :depression_level, :anxiety_level
  json.url activity_url(activity, format: :json)
end
