class Item < ApplicationRecord
  belongs_to :user
  has_one :buying
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :area
  belongs_to_active_hash :delivery_days

  with_options presence: true do
    validates :name
    validates :price
    validates :text
    validates :category
    validates :status
    validates :delivery_fee
    validates :area
    validates :delivery_days
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :area_id
    validates :delivery_days_id
  end
end
