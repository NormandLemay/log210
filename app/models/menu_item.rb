class MenuItem < ActiveRecord::Base
  	belongs_to :menu
  	validates :nom, :prix, presence: true
end