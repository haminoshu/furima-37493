require 'rails_helper'

RSpec.describe BuyDelivery, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buy_delivery = FactoryBot.build(:buy_delivery, user_id: user.id, item_id: item.id)
    end

    context '商品購入できるとき' do
      it 'token、post_code、prefecture_id、municipality、address、phone_numberが存在すれば登録できる' do
        expect(@buy_delivery).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'tokenが空では登録できない' do
        @buy_delivery.token = nil
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空では登録できない' do
        @buy_delivery.post_code = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号は半角数字かつハイフン「-」がなければ登録できない' do
        @buy_delivery.post_code = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include('Post code is not a number. Include hyphen(-)')
      end

      it '都道府県に「--」が選択されている場合は登録できない' do
        @buy_delivery.prefecture_id = '1'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村がない場合は登録できない' do
        @buy_delivery.municipality = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Municipality can't be blank")
      end

      it '番地がない場合は登録できない' do
        @buy_delivery.address = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号がない場合は登録できない' do
        @buy_delivery.phone_number = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号は10桁以上かつ11桁以下の半角数字でなければ登録できない' do
        @buy_delivery.phone_number = 1
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include('Phone number is not a number.Phone number must be greater than or equal to 10, or must be less than or equal to 11')
      end
    end
  end
end
