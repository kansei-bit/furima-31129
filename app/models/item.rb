class Item < ApplicationRecord
  belongs_to :user

  validates :name, :description, :price, null: false
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :shipping_date_id
  end
end
