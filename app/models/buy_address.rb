class BuyAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]+\z/, length: { in: 1..11 } }
    validates :item_id
    validates :user_id
  end

  def save
    buy = Buy.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number,
                   building_name: building_name, phone_number: phone_number, buy_id: buy.id)
  end
end
