class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :user_name
      t.string :comment

      t.timestamps null: false
    end
  end
end
