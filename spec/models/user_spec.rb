require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_rubyとfirst_name_ruby、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが数字のみでは登録できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には半角英字と半角数字の両方を含めて設定してください")
    end
    it 'passwordは全角では登録できない' do
      @user.password = 'ｐａｓｓｗｏｒｄ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には半角英字と半角数字の両方を含めて設定してください")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
    end
    it 'last_name_rubyが空では登録できない' do
      @user.last_name_ruby = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name ruby can't be blank")
    end
    it 'first_name_rubyが空では登録できない' do
      @user.first_name_ruby = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name ruby can't be blank")
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが129文字以上では登録できない' do
      @user.password = Faker::Internet.password(min_length: 129)
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
    end
    it 'passwordが半角英字と半角数字の両方を含めていない場合は登録できない' do
      @user.password = 'password'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password には半角英字と半角数字の両方を含めて設定してください')
    end
    it 'last_nameが全角でないと登録できない' do
      @user.last_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
    end
    it 'first_nameが全角でないと登録できない' do
      @user.first_name = 'hanako'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
    end
    it 'last_name_rubyが全角カナでないと登録できない' do
      @user.last_name_ruby = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name ruby 全角カナを使用してください')
    end
    it 'first_name_rubyが全角カナでないと登録できない' do
      @user.first_name_ruby = 'hanako'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name ruby 全角カナを使用してください')
    end
  end
end
