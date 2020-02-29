class CreatePurchaseListItems < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_list_items do |t|
      t.references :purchase_list, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :price
      t.decimal :total_price

      t.timestamps
    end
  end
end
