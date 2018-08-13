class Inventory < ApplicationRecord
	def self.search(search)
		where("description LIKE ?","%#{search}%")
	end
end
