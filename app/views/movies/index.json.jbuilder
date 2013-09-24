json.array!(@movies) do |movie|
  json.extract! movie, :url
  json.url movie_url(movie, format: :json)
end
