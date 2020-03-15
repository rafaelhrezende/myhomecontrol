class AddContextToPurchaseLists < ActiveRecord::Migration[6.0]
  def change
    add_reference :purchase_lists, :context, foreign_key: true
  end
end
