class Compte < ActiveRecord::Base
  belongs_to :client
  belongs_to :restaurateur
  belongs_to :livreur
end
