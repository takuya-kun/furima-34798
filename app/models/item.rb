class Item < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :product_name
    validates :text
    validates :category_id
    validates :condition_id
    validates :burden_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :price
  end
end