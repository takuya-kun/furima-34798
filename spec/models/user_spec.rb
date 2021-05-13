require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context 'ユーザー新規登録ができる時' do
      it '入力必須項目が全て存在すれば登録できること' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上であれば登録できること' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end

      it 'last_nameが全角入力(漢字、ひらがな、カタカナ)で登録できること' do
        @user.last_name = '亜あア'
        expect(@user).to be_valid
      end

      it 'first_nameが全角入力(漢字、ひらがな、カタカナ)で登録できること' do
        @user.first_name = '亜あア'
        expect(@user).to be_valid
      end

      it 'ruby_last_nameが全角入力(カタカナ)で登録できること' do
        @user.ruby_last_name = 'アアア'
        expect(@user).to be_valid
      end

      it 'ruby_first_nameが全角入力(カタカナ)で登録できること' do
        @user.ruby_first_name = 'アアア'
        expect(@user).to be_valid
      end
    end

    context 'ユーザー新規登録ができない時' do
      it 'nicknameが空では登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailが＠を含まない場合登録できないこと' do
        @user.email = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordは英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordは数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが全角では登録できないこと' do
        @user.password = 'ａｂｃ１２３'
        @user.password_confirmation = 'ａｂｃ１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'last_nameが空では登録できないこと' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'last_nameが全角入力でなければ登録できないこと' do
        @user.last_name = 'ｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end

      it 'first_nameが空では登録できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'first_nameが全角入力でなければ登録できないこと' do
        @user.first_name = 'ｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it 'ruby_last_nameが空では登録できないこと' do
        @user.ruby_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Ruby last name can't be blank")
      end

      it 'ruby_last_nameが全角入力(漢字、ひらがな)で登録できないこと' do
        @user.ruby_last_name = '亜あ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Ruby last name is invalid')
      end

      it 'ruby_last_nameが全角入力でなければ登録できないこと' do
        @user.ruby_last_name = 'ｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Ruby last name is invalid')
      end

      it 'ruby_first_nameが空では登録できないこと' do
        @user.ruby_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Ruby first name can't be blank")
      end

      it 'ruby_first_nameが全角入力(漢字、ひらがな)で登録できないこと' do
        @user.ruby_first_name = '亜あ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Ruby first name is invalid')
      end

      it 'ruby_first_nameが全角入力でなければ登録できないこと' do
        @user.ruby_first_name = 'ｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Ruby first name is invalid')
      end

      it 'birthdayが空では登録できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
