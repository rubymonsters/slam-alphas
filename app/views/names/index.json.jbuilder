json.array!(@names) do |name|
  json.extract! name, :id, :city, :country, :email, :age
  json.url name_url(name, format: :json)
end
