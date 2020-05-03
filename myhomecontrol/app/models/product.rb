class Product < ApplicationRecord
  has_many :purchase_list_items
  belongs_to :context
  default_scope { order('name') }

  def to_s
    "#{name} #{brand}"
  end

  include PgSearch
  pg_search_scope :search, against: [:name, :category, :brand],
  using: {
        tsearch: {
          prefix: true
        }
      }

  def search_products term
    current_user.get_current_context.products.search(term)
  end

end
