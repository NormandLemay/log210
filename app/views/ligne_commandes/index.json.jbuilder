json.array!(@ligne_commandes) do |ligne_commande|
  json.extract! ligne_commande, :id
  json.url ligne_commande_url(ligne_commande, format: :json)
end
