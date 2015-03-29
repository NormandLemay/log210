class Address < ActiveRecord::Base
  belongs_to :client
  has_one :commande

  def adresse_complete
    "#{self.no_civic} #{self.rue} #{self.ville}"
  end
end
