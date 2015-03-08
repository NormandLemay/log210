class Restaurant < ActiveRecord::Base
  belongs_to :restaurateur  
  has_many :menus
  accepts_nested_attributes_for :menus, :allow_destroy =>true

end
