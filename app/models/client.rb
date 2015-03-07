class Client < ActiveRecord::Base
	has_many :address
	has_one :compte
	accepts_nested_attributes_for :address
	accepts_nested_attributes_for :compte

end
