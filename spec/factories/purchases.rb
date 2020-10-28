FactoryBot.define do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
  end
  factory :purchase do
    zip_code { '123-4567' }
    prefecture_id { 3 }
    city { '横浜市' }
    town { '青山1-2-1' }
    apartment_number { '柳ビル211' }
    tel { '0202221121' }
    user_id {}
    item_id {}
    token { 'tok_05cad0c640c8e0db8dde250b7ee1' }
  end
end
