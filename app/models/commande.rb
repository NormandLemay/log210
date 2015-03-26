class Commande < ActiveRecord::Base
  has_many :ligne_commande
end
