class AddItemToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :Item, :string
  end
end
