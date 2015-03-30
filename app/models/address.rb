class Address < ActiveRecord::Base
  belongs_to :client
  has_one :commande
  belongs_to :restaurant


  def adresse_complete
    "#{self.no_civic} #{self.rue} #{self.ville}"
  end

end
