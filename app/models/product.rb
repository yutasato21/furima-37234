class Product < ApplicationRecord
  validates :name,               presence: true
  validates :text,               presence: true
  validates :image,              presence: true
  validates :category_id,        numericality: { other_than: 1 , message: "can't be blank"}
  validates :situation_id,       numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefectures_id,     numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_day_id,    numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,              presence: true

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery_charge
  belongs_to :prefectures
  belongs_to :delivery_day
end
