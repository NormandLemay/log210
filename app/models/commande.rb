class Commande < ActiveRecord::Base
  has_many :plat
  has_one :ligne_commande
end
