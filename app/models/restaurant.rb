class Restaurant < ActiveRecord::Base
  belongs_to :restaurateur
  has_many :commandes
  has_many :menus, dependent: :delete_all
  has_many :address, dependent: :delete_all
  accepts_nested_attributes_for :menus, allow_destroy: true
  accepts_nested_attributes_for :address, allow_destroy: true
end
