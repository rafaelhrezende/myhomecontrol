class Product < ApplicationRecord
  has_many :purchase_list_items

  def to_s
    "#{name} #{brand}"
  end
end
