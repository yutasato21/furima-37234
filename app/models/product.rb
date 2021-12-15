class Product < ApplicationRecord
  validates :name,               presence: true
  validates :text,               presence: true
  validates :image,              presence: true
  validates :category_id,        presence: true
  validates :situation_id,       presence: true
  validates :delivery_charge_id, presence: true
  validates :prefectures_id,     presence: true
  validates :delivery_day_id,    presence: true
  validates :price,              presence: true

  belongs_to :user
  has_one_attached :image
end
