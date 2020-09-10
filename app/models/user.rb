class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :buyings

  

  with_options presence: true do
    writing = /\A[ぁ-んァ-ン一-龥]+\z/
    reading = /\A[ァ-ヶー－]+\z/

    validates :nickname
    validates :birthday
    validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :password, length: {minimum: 6}, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
    validates :last_name, format: { with: writing}
    validates :first_name, format: { with: writing}
    validates :last_name_reading, format: { with: reading}
    validates :first_name_reading, format: { with: reading}
  end
end
