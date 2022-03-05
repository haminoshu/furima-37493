require 'rails_helper'

RSpec.describe Item, type: :model do

    before do
      @item = FactoryBot.build(:item)
    end
  
    describe '商品出品機能' do
      context '商品出品できるとき' do
        it 'items_name、items_price、explain、category_id、status_id、shipping_fee_burden_id、prefecture_id、delivery_day_id、items_price、imageが存在すれば登録できる' do
          expect(@item).to be_valid
        end
      
      end
      
      context '商品出品できないとき' do
        it 'items_nameが空では登録できない' do
          @item.items_name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Items name can't be blank")
        end
        end
        it '商品説明が空では登録できない' do
          @item.explain = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Explain can't be blank")
        end
        it '価格情報が空では登録できない' do
          @item.items_price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Items price can't be blank")
        end
        it '画像がない場合は登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
     
        it '300円以上でなければ登録できない' do
          @item.items_price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Items price must be greater than or equal to 300")
        end
        
        it '9999999円以下でなければ登録できない' do
          @item.items_price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Items price must be less than or equal to 9999999")
        end

      end
  end