class CreatePurchaseLists < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_lists do |t|
      t.string :name
      t.datetime :start
      t.datetime :finish
      t.decimal :totalprice
      t.string :company

      t.timestamps
    end
  end
end
