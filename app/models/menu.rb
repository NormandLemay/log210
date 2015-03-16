class Menu < ActiveRecord::Base
	belongs_to :restaurant
  	has_many :plats, :dependent => :delete_all
  	accepts_nested_attributes_for :plats, :allow_destroy =>true

  	validates :nom, presence: true
end
