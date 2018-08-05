class Products < ActiveRecord::Migration[5.2]
  def change
    add_column :Products, :content, :text, 
    add_column :Products, :image_name, :string
    add_column :Products, :price, :integer
  end
end
