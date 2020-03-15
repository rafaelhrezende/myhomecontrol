class AddContextToProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :context, foreign_key: true
  end
end
