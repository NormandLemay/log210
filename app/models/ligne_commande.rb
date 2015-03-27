class LigneCommande < ActiveRecord::Base
  belongs_to :commande
  has_one :plat

  accepts_nested_attributes_for :plat, :allow_destroy =>true
end
