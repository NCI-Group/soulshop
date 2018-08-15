class HomeController < ApplicationController
  def homepage
	return if current_user.nil?
	@prevPurchase = Purchase.where(user_id: current_user.id).last
  @allProducts = Inventory.all
  end
end
