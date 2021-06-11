require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @buy_address = FactoryBot.build(:buy_address)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buy_address).to be_valid
      end
      it 'building_nameは空でも保存出来ること' do
        @buy_address.building_name = ''
        expect(@buy_address).to be_valid
      end
      it 'postal_codeが半角入力(数字)のハイフンを含んだ正しい形式で保存できること' do
        @buy_address.postal_code = '123-4567'
        expect(@buy_address).to be_valid
      end
      it 'phone_numberが半角入力(数字)のハイフンを含んだ正しい形式で保存できること' do
        @buy_address.phone_number = '12345678901'
        expect(@buy_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空だと保存できないこと' do
        @buy_address.token = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @buy_address.postal_code = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buy_address.postal_code = '1234567'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'postal_codeが全角だと保存できないこと' do
        @buy_address.postal_code = '１２３-４５６７'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'prefecture_idが空だと保存できないこと' do
        @buy_address.prefecture_id = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @buy_address.city = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @buy_address.house_number = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @buy_address.phone_number = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが半角数字で正しい形式でないと保存できないこと' do
        @buy_address.phone_number = '1234567890'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが全角だと保存できないこと' do
        @buy_address.phone_number = '１２３４５６７８９０１'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
