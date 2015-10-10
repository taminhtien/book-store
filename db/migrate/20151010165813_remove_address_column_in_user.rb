class RemoveAddressColumnInUser < ActiveRecord::Migration
  def up
  	remove_column :users, :address_id
  end
end
