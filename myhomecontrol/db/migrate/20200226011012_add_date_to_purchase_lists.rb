class AddDateToPurchaseLists < ActiveRecord::Migration[6.0]
  def change
      remove_column :purchase_lists, :start
      remove_column :purchase_lists, :finish
      add_column :purchase_lists, :purchase_date, :date 
  end
end
