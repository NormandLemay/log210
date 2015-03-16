class Client < ActiveRecord::Base
	has_many :address, :dependent => :delete_all
	has_one :compte, :dependent => :delete
	accepts_nested_attributes_for :address
	accepts_nested_attributes_for :compte

end
