require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  describe '購入先住所の情報の保存' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @buy_address = FactoryBot.build(:buy_address, item_id: item.id, user_id: user.id)
      sleep 0.2
    end

    context '内容に問題ない場合' do
      it 'post_numberがあれば登録できること' do
        @buy_address.post_number = '123-4567'
        @buy_address.valid?
        expect(@buy_address).to be_valid
      end
      it 'ship_areaがあれば登録できること' do
        @buy_address.ship_area_id = 2
        @buy_address.valid?
        expect(@buy_address).to be_valid
      end
      it 'address_cityがあれば登録できること' do
        @buy_address.address_city = '新宿区'
        @buy_address.valid?
        expect(@buy_address).to be_valid
      end
      it 'address_noがあれば登録できること' do
        @buy_address.address_no = '1-1'
        @buy_address.valid?
        expect(@buy_address).to be_valid
      end
      it 'address_buildは空でも保存できること' do
        @buy_address.address_build = ''
        expect(@buy_address).to be_valid
      end
      it 'tele_numberがあれば登録できること' do
        @buy_address.tele_number = '09012345678'
        @buy_address.valid?
        expect(@buy_address).to be_valid
      end
      it 'tokenがあれば保存できること' do
        @buy_address.token = 'tok_abcdefghijk00000000000000000'
        @buy_address.valid?
        expect(@buy_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_numberが空だと保存できない' do
        @buy_address.post_number = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Post number can't be blank")
      end
      it 'post_numberが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buy_address.post_number = '1234567'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
      end
      it 'ship_areaを選択していないと保存できない' do
        @buy_address.ship_area_id = 1
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Ship area can't be blank")
      end
      it 'address_cityが空だと保存できない' do
        @buy_address.address_city = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Address city can't be blank")
      end
      it 'address_noが空だと保存できない' do
        @buy_address.address_no = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Address no can't be blank")
      end
      it 'tele_numberが空だと保存できない' do
        @buy_address.tele_number = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Tele number can't be blank")
      end
      it 'tele_numberは11桁以内でないと保存できない' do
        @buy_address.tele_number = '090123456789'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Tele number is too long (maximum is 11 characters)")
      end
      it 'itemが紐付いていないと保存できない' do
        @buy_address.item_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'userが紐づいていないと保存できない' do
        @buy_address.user_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("User can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @buy_address.token = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end