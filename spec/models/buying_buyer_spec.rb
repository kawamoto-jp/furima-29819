require 'rails_helper'

RSpec.describe BuyingBuyer, type: :model do
  before do
    @buying_buyer = FactoryBot.build(:buying_buyer)
  end

  describe '購入機能' do
    context 'うまく購入できるとき' do
      it "building_name以外の全ての項目が埋まっていること" do
        expect(@buying_buyer).to be_valid
      end
    end
  
    context '購入できないとき' do
      it "郵便番号が空のとき" do
        @buying_buyer.postal_code = ""
        @buying_buyer.valid?
        expect(@buying_buyer.errors.full_messages).to include("Postal code can't be blank")
      end
      it "郵便番号には123-4567の形でないとき" do
        @buying_buyer.postal_code = "1234-567"
        @buying_buyer.valid?
        expect(@buying_buyer.errors.full_messages).to include("Postal code is invalid")
      end
      it "都道府県が選択されていないとき" do
        @buying_buyer.prefectures_id = "1"
        @buying_buyer.valid?
        expect(@buying_buyer.errors.full_messages).to include("Prefectures must be other than 1")
      end
      it "市区町村が空のとき" do
        @buying_buyer.city = ""
        @buying_buyer.valid?
        expect(@buying_buyer.errors.full_messages).to include("City can't be blank")
      end
      it "市区町村に漢字ひらがなカタカナ以外が入っている時" do
        @buying_buyer.city = "12男"
        @buying_buyer.valid?
        expect(@buying_buyer.errors.full_messages).to include("City is invalid")
      end
      it "番地が空のとき" do
        @buying_buyer.address = ""
        @buying_buyer.valid?
        expect(@buying_buyer.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号が半角数字のみで、10桁もしくは11桁以内出ないとき" do
        @buying_buyer.tel = "090"
        @buying_buyer.valid?
        expect(@buying_buyer.errors.full_messages).to include("Tel is invalid")
      end
    end
  end
end