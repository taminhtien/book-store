class AddOptionalInformationToBooks < ActiveRecord::Migration
  def change
    add_column :books, :author, :string
    add_column :books, :publisher, :string
    add_column :books, :weight, :integer
    add_column :books, :pages, :integer
    add_column :books, :public_date, :string
    add_column :books, :categories, :string
  end
end
