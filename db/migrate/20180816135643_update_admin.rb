class UpdateAdmin < ActiveRecord::Migration[5.0]
  def change
	@u = User.find_by( email: 'admin@admin.admin' )
	if @u != nil
		@u.update_attribute :admin, true
	end
  end
end
