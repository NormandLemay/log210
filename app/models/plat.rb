class Plat < ActiveRecord::Base
    belongs_to :menu
    has_many :description_plats
    accepts_nested_attributes_for :description_plats, :allow_destroy =>true
end