class PurchaseList < ApplicationRecord
  validates :name, presence: true,
                   length: {minimum: 5}
  default_scope { order('name') }

  has_many :purchase_list_items
  belongs_to :context

  def total
    totalprice = 0
    purchase_list_items.each do |item|
      totalprice += item.total
    end
    totalprice
  end

  def quantity
    purchase_list_items.count
  end

  def to_s
    "\##{id}: #{name}"
  end
end
