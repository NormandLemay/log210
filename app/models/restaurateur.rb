class Restaurateur < ActiveRecord::Base
  has_many :restaurants, :dependent => :delete_all
  has_one :compte
  accepts_nested_attributes_for :restaurants, :allow_destroy =>true
	accepts_nested_attributes_for :compte

end
