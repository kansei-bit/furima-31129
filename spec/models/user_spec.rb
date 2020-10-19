require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nickname, email, password, password_confirmatino, lname, fname, lname_katakana, fname_katakana, birth_dateが存在すれば登録できる' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '既に登録されているemailでは登録できない' do
      another_user = FactoryBot.create(:user)
      @user.email = another_user.email
      @user.valid?
      expect(@user.errors.full_messages).to include('Email has already been taken')
    end

    it '@を含まないemailでは登録できない' do
      @user.email.delete!('@')
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが空では登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが6字以上であれば登録できる' do
      password = '123abc'
      @user.password = password
      @user.password_confirmation = password
      @user.valid?
      expect(@user).to be_valid
    end

    it '6文字未満のpasswordでは登録できない' do
      password = '123ab'
      @user.password = password
      @user.password_confirmation = password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが半角数字だけでは登録できない' do
      password = '123456'
      @user.password = password
      @user.password_confirmation = password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end
    
    it 'passwordが半角英字だけでは登録できない' do
      password = 'abcdefg'
      @user.password = password
      @user.password_confirmation = password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'password_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordとpassword_confirmationの値が一致していなければ登録できない' do
      @user.password_confirmation = Faker::Internet.password(min_length: 6)
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'lmaneが空では登録できない' do
      @user.lname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Lname can't be blank")
    end

    it 'fmaneが空では登録できない' do
      @user.fname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Fname can't be blank")
    end

    it 'fmaneは全角でなければ登録できない' do
      @user.lname = Faker::Name.name
      @user.valid?
      expect(@user.errors.full_messages).to include('Lname Full-width characters')
    end

    it 'fmaneは全角でなければ登録できない' do
      @user.fname = Faker::Name.name
      @user.valid?
      expect(@user.errors.full_messages).to include('Fname Full-width characters')
    end

    it 'lname_katakanaが空では登録できない' do
      @user.lname_katakana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Lname katakana can't be blank")
    end

    it 'fmane_katakanaが空では登録できない' do
      @user.fname_katakana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Fname katakana can't be blank")
    end

    it 'fmane_katakanaは全角カタカナでなければ登録できない' do
      @user.lname_katakana = Faker::Name.name
      @user.valid?
      expect(@user.errors.full_messages).to include('Lname katakana Full-width katakana characters')
    end

    it 'fmane_katakanaは全角カタカナでなければ登録できない' do
      @user.fname_katakana = Faker::Name.name
      @user.valid?
      expect(@user.errors.full_messages).to include('Fname katakana Full-width katakana characters')
    end

    it 'birth_dateが空では登録できない' do
      @user.birth_date = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end
