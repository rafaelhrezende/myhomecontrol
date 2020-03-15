class Product < ApplicationRecord
  has_many :purchase_list_items
  belongs_to :context

  def to_s
    "#{name} #{brand}"
  end
end
