json.array!(@users) do |user|
  json.extract! user, :id, :name, :city, :country, :email, :year_of_birth
  json.url user_url(user, format: :json)
end
