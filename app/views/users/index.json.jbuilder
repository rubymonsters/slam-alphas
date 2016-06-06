json.array!(@users) do |user|
  json.extract! user, :id, :name, :city, :country, :email, :age
  json.url user_url(user, format: :json)
end
