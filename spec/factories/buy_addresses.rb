FactoryBot.define do
  factory :buy_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '12345678901' }
    item_id { 1 }
    user_id { 1 }
  end
end
