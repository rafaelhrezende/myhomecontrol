class Context < ApplicationRecord
  belongs_to :user
  has_many :products
  has_many :purchase_lists
end
