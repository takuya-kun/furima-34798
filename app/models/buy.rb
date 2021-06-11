class Buy < ApplicationRecord
  has_one :address
  belongs_to :user
  belongs_to :item

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
