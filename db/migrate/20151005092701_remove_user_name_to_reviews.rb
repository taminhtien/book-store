class RemoveUserNameToReviews < ActiveRecord::Migration
  def up
  	remove_column :reviews, :user_name
  end

  def down 
  	add_column :reviews, :user_name, :string
  end
end
