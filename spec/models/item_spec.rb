require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    
    @item = FactoryBot.build(:item)
    
  end

  describe "商品出品機能" do
    context '商品出品ができるとき' do
      it "商品画像が1枚あれば出品できる" do
        expect(@item).to be_valid
      end
      it "商品名があれば出品できる" do
        @item.title = 'test'
        @item.valid?
        expect(@item).to be_valid
      end
      it "商品の説明があれば出品できる" do
        @item.description = 'test'
        @item.valid?
        expect(@item).to be_valid
      end
      it "カテゴリーの情報があれば出品できる" do
        @item.category_id = 2
        @item.valid?
        expect(@item).to be_valid
      end
      it "商品の状態についての情報があれば出品できる" do
        @item.item_status_id = 2
        @item.valid?
        expect(@item).to be_valid
      end
      it "配送料の負担についての情報があれば出品できる" do
        @item.delivery_cover_id = 2
        @item.valid?
        expect(@item).to be_valid
      end
      it "発送元の地域についての情報があれば出品できる" do
        @item.ship_area_id = 2
        @item.valid?
        expect(@item).to be_valid
      end
      it "発送までの日数についての情報があれば出品できる" do
        @item.ship_day_id = 2
        @item.valid?
        expect(@item).to be_valid
      end
      it "販売価格があれば出品できる" do
        @item.money = 9999
        @item.valid?
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it "商品画像がなければ出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名がなければ出品できない" do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it "商品の説明がなければ出品できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "カテゴリーの情報がなければ出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態についての情報がなければ出品できない" do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end
      it "配送料の負担についての情報がなければ出品できない" do
        @item.delivery_cover_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery cover can't be blank")
      end
      it "発送元の地域についての情報があれば出品できない" do
        @item.ship_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship area can't be blank")
      end
      it "発送までの日数についての情報がなければ出品できない" do
        @item.ship_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship day can't be blank")
      end
      it "販売価格がなければ出品できない" do
        @item.money = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Money can't be blank")
      end
      it "販売価格は全角文字では登録できないこと" do
        @item.money = 'あいうえお'
        @item.valid?
        expect(@item.errors.full_messages).to include("Money is invalid")
      end
      it "販売価格は半角英数混合では登録できないこと" do
        @item.money = '123abc'
        @item.valid?
        expect(@item.errors.full_messages).to include("Money is invalid")
      end
      it "販売価格は半角英語だけでは登録できないこと" do
        @item.money = 'abcdef'
        @item.valid?
        expect(@item.errors.full_messages).to include("Money is invalid")
      end
      it "販売価格は299円以下では登録できないこと" do
        @item.money = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Money is invalid")
      end
      it "販売価格は10,000,000以上では登録できないこと" do
        @item.money = 10000001
        @item.valid?
        expect(@item.errors.full_messages).to include("Money is invalid")
      end
      it "ユーザー情報がない場合は登録できないこと" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
