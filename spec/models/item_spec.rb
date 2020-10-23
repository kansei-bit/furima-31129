require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    context '出品がうまくいくとき' do
      it "nameとdescriptionとimageとpriceが存在すれば登録できる" do
      end
      it "category_idとstatus_idとdelivery_charge_idとprefecture_idとshipping_date_idのidが1以外なら登録できる" do
      end
      it "priceが300円以上9999999円以下なら登録できる" do
      end
      it "ユーザーが紐づいていると登録できる" do
      end
      end
    end

    context '出品がうまくいかないとき' do
      it "nameがなければ登録できない" do
      end
      it "descriptionがなければ登録できない" do
      end
      it "imageがなければ登録できない" do
      end
      it "priceがなければ登録できない" do
      end
      it "category_idが1ならば登録できない" do
      end
      it "status_idが1ならば登録できない" do
      end
      it "delivery_charge_idが1ならば登録できない" do
      end
      it "prefecture_idが1ならば登録できない" do
      end
      it "shipping_date_idが1ならば登録できない" do
      end
      it "priceが300円未満ならば登録できない" do
      end
      it "priceが9999999円より大きければ登録できない" do
      end
      it "ユーザーが紐づいていなければ登録できない" do
      end
    end
  end
end
