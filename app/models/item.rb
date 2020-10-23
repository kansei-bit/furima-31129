class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :prefecture

  only_halfwidth_num = /\A[1-9][0-9]+\z/
  validates :price,
  presence: true,
  format: {with: only_halfwidth_num, message: 'only half-width number'},
  numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  with_options presence:true do
    validates :name
    validates :description
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :shipping_date_id
  end
end