require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @purchase = FactoryBot.build(:purchase)
      @purchase.user_id = @user.id
      @purchase.item_id = @item.id
    end
    it 'すべての値が正しく入力されていれば決済ができること' do
      expect(@purchase).to be_valid
    end

    it 'apartment_numberは空でも保存ができること' do
      @purchase.apartment_number = nil
      expect(@purchase).to be_valid
    end

    it 'userが紐づいていないと保存ができないこと' do
      @purchase.user_id = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("User can't be blank")
    end

    it 'itemが紐づいていないと保存ができないこと' do
      @purchase.item_id = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Item can't be blank")
    end

    it 'zip_codeが空では保存ができないこと' do
      @purchase.zip_code = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Zip code can't be blank")
    end

    it 'zip_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase.zip_code = '1234567'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Zip code is invalid. Include hyphen(-)')
    end

    it 'prefecture_idが1だと保存ができないこと' do
      @purchase.prefecture_id = 1
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'cityが空だと保存ができないこと' do
      @purchase.city = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("City can't be blank")
    end

    it 'townが空だと保存ができないこと' do
      @purchase.town = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Town can't be blank")
    end

    it 'telが空だと保存ができないこと' do
      @purchase.tel = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Tel can't be blank")
    end

    it 'telがハイフンを含まない11桁以内の半角の数字でないと保存ができないこと' do
      @purchase.tel = '000-111-2222'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Tel is invalid')
    end

    it 'tokenが空では決済ができないこと' do
      @purchase.token = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Token can't be blank")
    end
  end
end
