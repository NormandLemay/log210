class Livreur < ActiveRecord::Base
  has_one :compte, :dependent => :delete
  accepts_nested_attributes_for :compte
end
