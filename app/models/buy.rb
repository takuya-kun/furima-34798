class Buy < ApplicationRecord
  has_one :address
  belongs_to :user
  belongs_to :item

  attr_accessor :token
end
