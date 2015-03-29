class Address < ActiveRecord::Base
	belongs_to :client


	def adresseComplete
		"#{no_civic} #{rue} #{ville}"
	end
end
