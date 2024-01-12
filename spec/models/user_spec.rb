require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ダメな時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'password が空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'first_name が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'last_name が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'sending_kana_for_first_name が空では登録できない' do
        @user.sending_kana_for_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Sending kana for first name can't be blank"
      end
      it 'sending_kana_for_last_name が空では登録できない' do
        @user.sending_kana_for_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Sending kana for last name can't be blank"
      end
      it 'date_of_birth が空では登録できない' do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Date of birth can't be blank"
      end
    end

    context 'OKな時' do
      it '正常に登録できること' do
        expect(@user).to be_valid
      end
    end
  end
end