class CartController < ApplicationController
	
	before_filter :authenticate_user!
	
	def add
		id = params[:id]
		
		if session[:cart] then
			cart = session[:cart]
		else
			session[:cart] = {}
			cart = session[:cart]
		end
		
		if cart[id] then
			cart[id] = cart[id] + 1
		else
			cart[id] = 1
		end
		
		redirect_to :action => :index
	end
	
	def remove
		id = params[:id]
		
		if session[:cart] then
			cart = session[:cart]
		end
		
		if cart[id] then
			cart[id] = cart[id] - 1
			if cart[id] < 1 then
				cart.delete(id)
			end
		end
		
		redirect_to :action => :index
	end
	
	def checkout
		# Get total cost of cart
		# Remove all items
		# Display flash notice thanking user for purchases
		if session[:cart] then
			cart = session[:cart]
		else
			cart = {}
		end
		
		totalSouls = 0
		totalCost = 0
		
		cart.each do |id, quantity|
			inv = Inventory.find_by_id(id)
			totalSouls += quantity
			totalCost += (quantity * inv.Cost)
		end
		
		cart = nil
		session[:cart] = nil
		
		flash[:notice] = "Thank you for your purchase of #{totalSouls} souls for #{totalCost} quarts of blood!"
		
		redirect_to :action => :index
	end
	
	def clearCart
		session[:cart] = nil
		redirect_to :action => :index
	end
	
	def index
		if session[:cart] then
			@cart = session[:cart]
		else
			@cart = {}
		end
	end
end
