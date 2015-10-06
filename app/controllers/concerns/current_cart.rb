module CurrentCart
	extend ActiveSupport::Concern
	
	private
		
		# Gets the :cart_id from the session and attempts to find 
		# a cart corresponding to this in the database
		
		def set_cart
			@cart = Cart.find(session[:cart_id])
		rescue ActiveRecord::RecordNotFound
			@cart = Cart.create
			session[:cart_id] = @cart.id
		end
end