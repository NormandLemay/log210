json.array!(@livreurs) do |livreur|
  json.extract! livreur, :id, :nom, :prenom, :compte_id
  json.url livreur_url(livreur, format: :json)
end
