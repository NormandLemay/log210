class LigneCommande < ActiveRecord::Base
  belongs_to :commande
  has_one :plat
end
