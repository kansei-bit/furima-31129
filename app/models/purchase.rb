class Purchase
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :zip_code, :prefecture_id, :city, :town, :apartment_number, :tel, :order_id
  # Orderモデルのバリデーション
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
  end
  # Addressモデルのバリデーション
  with_options presence: true do
    validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :town
    validates :tel, format: { with: /\A[0-9]{10,11}\z/ }
  end
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, town: town, apartment_number: apartment_number, tel: tel, order_id: order.id)
  end
end
