class Restaurateur < ActiveRecord::Base
  has_many :restaurants, :dependent => :delete_all
  accepts_nested_attributes_for :restaurants, :allow_destroy =>true
end
