class AddUnityToPurchaseListItems < ActiveRecord::Migration[6.0]
  def change
    add_column :purchase_list_items, :unity, :string, :limit =>  3
  end
end
