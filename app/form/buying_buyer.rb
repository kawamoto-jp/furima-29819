class BuyingBuyer

  include ActiveModel::Model
  attr_accessor :name, :name_reading, :nickname, :postal_code, :prefectures_id, :city, :house_number, :building_name, :price, :address, :tel, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefectures_id, numericality: { other_than: 1 }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :address
    validates :tel, format: { with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :item_id
  end

  def save
    buying = Buying.create(user_id: user_id, item_id: item_id)  #この二つの情報以外にcreate_atとかidとかも保存されている。だから下でbuyingnoのidが指定できる
    Buyer.create(buying_id: buying.id, postal_code: postal_code, prefectures_id: prefectures_id, city: city, address: address, building_name: building_name, tel: tel)
  end
end