class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :buyings

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :password, length: {minimum: 6}, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
    validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
    validates :last_name_reading, :first_name_reading, format: { with: /\A[ァ-ヶー－]+\z/}
  end
end
