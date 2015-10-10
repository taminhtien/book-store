class RemoveIndexBetweenUserAndAddress < ActiveRecord::Migration
  def up
  	remove_index :users, column: :address_id
  end
end
