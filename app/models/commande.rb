class Commande < ActiveRecord::Base
  has_many :ligne_commandes
  belongs_to :restaurant
  before_validation :init_valeur, :calcul_total

  accepts_nested_attributes_for :ligne_commandes, :allow_destroy =>true


  private

    def init_valeur
      self.date ||= DateTime.parse(Time.now.to_s).strftime('%d/%m/%Y')
      self.heure ||= DateTime.parse(Time.now.to_s).strftime('%H:%M')
      self.status ||= 'A preparer'
      self.numero_confirmation ||= rand(1...50_000)
    end

  def calcul_total
    totalTempo = 0;
    self.ligne_commandes.each do |lc|
      @plat = Plat.find(lc.plat_id)
      totalTempo += lc.quantite * @plat.description_plats.first.prix
    end
    self.total ||= totalTempo
  end
end
