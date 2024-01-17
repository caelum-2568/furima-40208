require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.create(:item)
  end

  describe '商品の出品登録' do
    context 'ダメな時' do
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'grade_idが空では登録できない' do
        @item.grade_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Grade can't be blank"
      end
      it 'postage_idが空では登録できない' do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Postage can't be blank"
      end
      it 'date_of_shipment_idが空では登録できない' do
        @item.date_of_shipment_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Date of shipment can't be blank"
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが300円未満だと出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include"Price must be greater than or equal to 300"
      end
      it 'priceが9,999,999円を超えると出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include"Price must be less than or equal to 9999999"
      end
    end

    context 'OKな時' do
      it '正常に登録できること' do
        expect(@item).to be_valid
      end
    end
  end
end
