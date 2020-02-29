class PurchaseListItem < ApplicationRecord
  belongs_to :purchase_list
  belongs_to :product

  def total
    if quantity.nil? || price.nil?
      return 0
    end
    quantity * price
  end

  def to_s
    "#{id}-#{product.to_s}"
  end
end
