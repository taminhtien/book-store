class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :name
      t.text :address
      t.string :email
      t.string :mobile

      t.timestamps null: false
    end
  end
end
