require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nicknameが空では登録できない" do
    end
    it "emailが空では登録できない" do
    end
    it "既に登録されているemailでは登録できない" do
    end
    it "@を含まないemailでは登録できない" do
    end
    it "passwordが空では登録できない" do
    end
    it "6文字未満のpasswordでは登録できない" do
    end
    it "passwordは半角英数字混合でなければ登録できない" do
    end
    it "password_confirmationが空では登録できない" do
    end
    it "passwordとpassword_confirmationの値が一致していなければ登録できない" do
    end
    it "lmaneが空では登録できない" do
    end
    it "fmaneが空では登録できない" do
    end
    it "fmaneは全角でなければ登録できない" do
    end
    it "fmaneは全角でなければ登録できない" do
    end
    it "lmane_katakanaが空では登録できない" do
    end
    it "fmane_katakanaが空では登録できない" do
    end
    it "fmane_katakanaは全角カタカナでなければ登録できない" do
    end
    it "fmane_katakanaは全角カタカナでなければ登録できない" do
    end
    it "birth_dateが空では登録できない" do
    end
  end
end