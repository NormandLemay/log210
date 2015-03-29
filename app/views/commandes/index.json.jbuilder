json.array!(@commandes) do |commande|
  json.extract! commande, :id
  json.url commande_url(commande, format: :json)
end
