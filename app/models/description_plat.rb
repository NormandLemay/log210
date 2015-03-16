class DescriptionPlat < ActiveRecord::Base
  	belongs_to :plat
  	validates :nom, :prix, presence: true
end