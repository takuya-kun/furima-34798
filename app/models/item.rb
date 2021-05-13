class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :shipping_day

  with_options presence: true do
    validates :image
    validates :product_name
    validates :text

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :burden_id
      validates :prefecture_id
      validates :shipping_day_id
    end

    validates :price
  end
end