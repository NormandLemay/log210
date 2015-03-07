json.array!(@clients) do |client|
  json.extract! client, :id, :nom, :prenom, :date_naissance, :compte_id
  json.url client_url(client, format: :json)
end
