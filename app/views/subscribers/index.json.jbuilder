json.array!(@subscribers) do |subscriber|
  json.extract! subscriber, :name, :email
  json.url subscriber_url(subscriber, format: :json)
end
