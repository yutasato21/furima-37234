require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入記録と発送先の保存' do
    before do
      user = FactoryBot.create(:user)
      product = FactoryBot.create(:product)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, product_id: product.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@purchase_address).to be_valid
      end

      it 'buildingが空でも保存できる' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postが空では保存できない' do
        @purchase_address.post = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post can't be blank")
      end

      it 'prefectures_idが”---”[1]では保存できない' do
        @purchase_address.prefectures_id = '1'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefectures can't be blank")
      end

      it 'municipalitiesが空では保存できない' do
        @purchase_address.municipalities = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipalities can't be blank")
      end

      it 'post_numberが空では保存できない' do
        @purchase_address.post_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Number can't be blank")
      end

      it 'telephoneが空では保存できない' do
        @purchase_address.telephone = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone can't be blank")
      end

      it 'postは全角数値では保存できない' do
        @purchase_address.post = '０００-００００'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Post is invalid. Include hyphen(-)')
      end

      it 'postは"-"の前は半角数値3桁でないと保存できない' do
        @purchase_address.post = '00-0000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Post is invalid. Include hyphen(-)')
      end

      it 'postは"-"の後は半角数値4桁でないと保存できない' do
        @purchase_address.post = '000-000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Post is invalid. Include hyphen(-)')
      end

      it 'telephoneは9桁以下では保存できない' do
        @purchase_address.telephone = '000000000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Telephone Input only number')
      end

      it 'telephoneは12桁以上では保存できない' do
        @purchase_address.telephone = '000000000000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Telephone Input only number')
      end

      it 'telephoneは半角数値のみでないと保存できない' do
        @purchase_address.telephone = '000-0000-0000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Telephone Input only number')
      end

      it 'user_idが紐づいていないと保存できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end

      it 'product_idが紐づいていないと保存できない' do
        @purchase_address.product_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Product can't be blank")
      end

      it 'tokenが空では保存できない' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
