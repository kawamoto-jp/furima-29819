require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品機能' do
    context 'うまく出品できるとき' do
      it "全ての項目が埋まっていること" do
        expect(@item).to be_valid
      end
    end
  
    context 'うまく出品できないとき' do
      it "画像が選択されていないとき" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が空のとき" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の説明が空のとき" do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it "カテゴリーの情報が選択されていないとき" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "商品の状態についての情報が選択されていないとき" do
        @item.status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it "配送料の負担についての情報が選択されていないとき" do
        @item.delivery_fee_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end
      it "発送元の地域についての情報が選択されていないとき" do
        @item.area_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end
      it "発送までの日数についての情報が選択されていないとき" do
        @item.delivery_days_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days must be other than 1")
      end
      it "価格についての情報が選択されていないとき" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格が、¥300以下のとき" do
        @item.price = "10"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "価格が、¥9,999,999以上のとき" do
        @item.price = "19999999"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "販売価格は半角数字以外で入力されたとき" do
        @item.price = "１００００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
