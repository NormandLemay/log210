class Commande < ActiveRecord::Base
  has_many :ligne_commandes
  has_many :address
  belongs_to :restaurant
  before_validation :init_valeur
  after_validation :calcul_total


  enum status: [:a_preparer, :en_preparation,
                :prete, :en_livraison, :livrer]

  accepts_nested_attributes_for :ligne_commandes, allow_destroy: true


  accepts_nested_attributes_for :address, :allow_destroy =>true
  private


  def passer_etape_suivante
    if self.a_preparer?
      self.en_preparation!
    elsif self.en_preparation?
      self.prete!
    elsif self.prete?
      self.en_livraison!
    else
      self.livrer!
    end
  end

  private

  def init_valeur
    self.date ||= DateTime.parse(Time.now.to_s).strftime('%d/%m/%Y')
    self.heure ||= DateTime.parse(Time.now.to_s).strftime("%I:%M")
    self.numero_confirmation ||= rand(1...50_000)
    self.total = 0

  end

  def calcul_total
    if self.total == 0
      self.ligne_commandes.each do |lc|
        self.total += lc.calculer_total
      end
    end

  end


  def ajoutNouvelleAdresse()
    flash[:warning] = 'Aucun restaurateur sélectionné'
  end

end
