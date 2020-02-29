class AddBrandToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :brand, :string, :limit => 50
  end
end
