class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :post, :prefectures_id, :municipalities, :post_number, :building, :telephone, :token

  with_options presence: true do
    validates :post, format: { with: /\A[0-9]{3}-[0-9]{4}\Z/, message: 'is invalid. Include hyphen(-)' }
    validates :municipalities
    validates :post_number
    validates :telephone, format: { with: /\A\d{10,11}\z/, message: 'Input only number' }
    validates :user_id
    validates :product_id
    validates :token
  end
  validates :prefectures_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    purchase = Purchase.create(user_id: user_id, product_id: product_id)

    Address.create(post: post, prefectures_id: prefectures_id, municipalities: municipalities, post_number: post_number,
                   building: building, telephone: telephone, purchase_id: purchase.id)
  end
end
