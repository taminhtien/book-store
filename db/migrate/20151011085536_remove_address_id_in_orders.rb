class RemoveAddressIdInOrders < ActiveRecord::Migration
  def up
  	remove_column :orders, :address_id
  end
end
