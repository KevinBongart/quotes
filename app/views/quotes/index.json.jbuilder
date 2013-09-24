json.array!(@quotes) do |quote|
  json.extract! quote, :movie_id, :text
  json.url quote_url(quote, format: :json)
end
