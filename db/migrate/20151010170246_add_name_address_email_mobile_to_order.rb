class AddNameAddressEmailMobileToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :name, :string
  	add_column :orders, :email, :string
  	add_column :orders, :address, :string
  	add_column :orders, :mobile, :string
  end
end
