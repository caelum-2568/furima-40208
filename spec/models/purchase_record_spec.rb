require 'rails_helper'
RSpec.describe PurchaseRecord, type: :model do
  before do
    @purchase_record = FactoryBot.build(:purchase_record)
  end

  describe '購入情報の保存' do
    context '購入情報の保存できる時' do
      it '正常に登録できること' do
        expect(@purchase_record).to be_valid
      end
    end

    context '購入情報の保存できない時' do
      it 'post_codeが空だと保存できない' do
        @purchase_record.post_code = ""
        @purchase_record.valid?
        expect(@purchase_record.errors[:post_code]).to include "can't be blank"
        expect(@purchase_record.errors[:post_code]).to include "is invalid. Include hyphen(-)"
      end
      it 'post_codeにハイフンがないと保存できない' do
        @purchase_record.post_code = "12345678"
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include "Post code is invalid. Include hyphen(-)"
      end
      it 'post_codeが8桁でないと保存できない' do
        @purchase_record.post_code = "123-456"
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include "Post code is invalid. Include hyphen(-)"
      end
      it 'prefecture_idが空だと保存できない' do
        @purchase_record.prefecture_id = ""
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'municipalitiesが空だと保存できない' do
        @purchase_record.municipalities = ""
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include "Municipalities can't be blank"
      end
      it 'street_addressが空だと保存できない' do
        @purchase_record.street_address = ""
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include "Street address can't be blank"
      end
      it 'telephone_numberが空だと保存できない' do
        @purchase_record.telephone_number = ""
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include "Telephone number can't be blank", "Telephone number is invalid"
      end
      it 'telephone_numberが11桁でなければ保存できない' do
        @purchase_record.telephone_number = "080123456789"
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include "Telephone number is invalid"
      end
      it 'token(クレジットカード情報)が空だと購入ができない' do
        @purchase_record.token = ""
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include "Token can't be blank"
      end
    end  
  end
end
    