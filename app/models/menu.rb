class Menu < ActiveRecord::Base
	belongs_to :restaurant
  	has_many :menu_items
  	accepts_nested_attributes_for :menu_items, :allow_destroy =>true

  	validates :nom, presence: true
end
