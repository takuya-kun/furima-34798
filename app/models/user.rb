class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :password, format:{ with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/ }

    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥]+\z/ } do
      validates :last_name
      validates :first_name
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :ruby_last_name
      validates :ruby_first_name
    end

    validates :birthday
  end
end
