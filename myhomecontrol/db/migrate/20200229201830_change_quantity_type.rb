class ChangeQuantityType < ActiveRecord::Migration[6.0]
  def change
    change_column :purchase_list_items, :quantity, :decimal
  end
end
