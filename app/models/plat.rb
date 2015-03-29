class Plat < ActiveRecord::Base
    belongs_to :menu
    belongs_to :ligne_commande
    has_many :description_plats
    accepts_nested_attributes_for :description_plats, :allow_destroy =>true
end