require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品登録' do
    context '新規登録ができる時' do
      it '正常に登録できること' do
        expect(@item).to be_valid
      end
    end

    context '新規登録ができない時' do
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it 'ユーザーが紐づいていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
      it '画像が空の場合登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
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
      it 'category_idが--では登録できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category must be other than 0'
      end
      it 'grade_idが空では登録できない' do
        @item.grade_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Grade can't be blank"
      end
      it 'grade_idが--では登録できない' do
        @item.grade_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Grade must be other than 0'
      end
      it 'postage_idが空では登録できない' do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Postage can't be blank"
      end
      it 'postage_idが--では登録できない' do
        @item.postage_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Postage must be other than 0'
      end
      it 'date_of_shipment_idが空では登録できない' do
        @item.date_of_shipment_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Date of shipment can't be blank"
      end
      it 'date_of_shipment_idが--では登録できない' do
        @item.date_of_shipment_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Date of shipment must be other than 0'
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'prefecture_idが--では登録できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Prefecture must be other than 0'
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが半角英数以外では登録できない' do
        @item.price = 'あいう'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it 'priceが300円未満だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end
      it 'priceが9,999,999円を超えると出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end
    end
  end
end
