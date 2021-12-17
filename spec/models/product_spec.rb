require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品' do
    context '商品出品できる場合' do
      it 'name、text、category_id、situation_id、delivery_charge_id、prefectures_id、delivery_day_id、price、user_idが存在していれば保存できる' do
        expect(@product).to be_valid
      end
    end

    context '商品出品できない場合' do
      it 'nameが空では出品できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end

      it 'textが空では出品できない' do
        @product.text = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Text can't be blank")
      end

      it 'category_idの値が"---"[1]では出品できない' do
        @product.category_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

      it 'situation_idの値が"---"[1]では出品できない' do
        @product.situation_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Situation can't be blank")
      end

      it 'delivery_charge_idの値が"---"[1]では出品できない' do
        @product.delivery_charge_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery charge can't be blank")
      end

      it 'prefectures_idの値が"---"[1]では出品できない' do
        @product.prefectures_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefectures can't be blank")
      end

      it 'delivery_day_idの値が"---"[1]では出品できない' do
        @product.delivery_day_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery day can't be blank")
      end

      it 'priceが空では出品できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it 'imageが空では出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it 'userが紐づいていないと出品できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('User must exist')
      end

      it 'priceが299以下では出品できない' do
        @product.price = '100'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it 'priceが9999999以上では出品できない' do
        @product.price = '10000000'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'priceが半角文字では出品できない' do
        @product.price = 'gohyaku'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end

      it 'priceが全角数字では出品できない' do
        @product.price = '５００'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end

      it 'priceが全角文字では出品できない' do
        @product.price = '五百'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
