class CombineItemsInCart < ActiveRecord::Migration
  def up
  	# Replaces multiple items for a single product in a cart with a single item
		Cart.all.each do |cart|
			# Counts the number of each product in the cart
			sums = cart.line_items.group(:book_id).sum(:quantity)
			sums.each do |book_id, quantity|
				if quantity > 1
					# Removes individual items
					cart.line_items.where(book_id: book_id).delete_all
					# Replaces with a single item
					item = cart.line_items.build(book_id: book_id)
					item.quantity = quantity
					item.save!
				end
			end
		end
  end
end
