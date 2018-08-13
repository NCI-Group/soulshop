class CheckoutController < ApplicationController
  def checkout
	
	if session[:cart] then
		cart = session[:cart]
		
		totalSouls = 0
		totalCost = 0
	
		cart.each do |id, quantity|
			inv = Inventory.find_by_id(id)
			if inv.nil? then
				next
			end
			totalSouls += quantity
			totalCost += (quantity * inv.Cost)
		end
		
		session[:cart] = nil
		flash[:notice] = "Thank you for your purchase of #{totalSouls} souls for #{totalCost} quarts of blood!"
		
	else
		# Nothing in the cart, cannot complete purchase
		flash[:notice] = "Cannot check out with nothing in cart."
	end
	
  end
end
