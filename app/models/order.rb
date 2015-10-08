class Order < ActiveRecord::Base
	PAYMENT_TYPES = [ "At destination place",
		"Internet Banking",
		"Visa, MasterCard" ]
	validates :name, :address, :email, :mobile, presence: true
	validates :pay_type, inclusion: PAYMENT_TYPES

	has_many :line_items

	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id = nil # Prevents the item from going poof when we destroy the cart
			line_items << item
		end
	end
end
