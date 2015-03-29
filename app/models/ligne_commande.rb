class LigneCommande < ActiveRecord::Base
  belongs_to :commande
  has_one :plat

  accepts_nested_attributes_for :plat, :allow_destroy =>true

  MAX_QUANTITE = (1..5).to_a.freeze

  validates :quantite, :numericality => {
    :greater_than_or_equal_to => MAX_QUANTITE.min,
    :less_than_or_equal_to => MAX_QUANTITE.max,
  }

  def calculer_total
    quantite * Plat.find(plat_id).description_plats.first.prix
  end
end
