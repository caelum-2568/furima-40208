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
      it 'emailが重複していると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'ab123'
        @user.password_confirmation = 'ab123'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password は半角英数字混合で入力してください'
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password は半角英数字混合で入力してください'
      end
      it 'passwordが全角文字を含むと登録できない' do
        @user.password = 'ａｂｃ１２３'
        @user.password_confirmation = 'ａｂｃ１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password は半角英数字混合で入力してください'
      end
      it 'passwordが不一致だと登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = '123abc'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'first_nameが(漢字・ひらがな・カタカナ)でないと登録できない' do
        @user.first_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name は全角（漢字・ひらがな・カタカナ）で入力してください'
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'last_nameが(漢字・ひらがな・カタカナ)でないと登録できない' do
        @user.last_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name は全角（漢字・ひらがな・カタカナ）で入力してください'
      end
      it 'sending_kana_for_first_nameが空では登録できない' do
        @user.sending_kana_for_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Sending kana for first name can't be blank"
      end
      it 'sending_kana_for_first_nameが(漢字・ひらがな・カタカナ)でないと登録できない' do
        @user.sending_kana_for_first_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Sending kana for first name は全角カタカナで入力してください'
      end
      it 'sending_kana_for_last_nameが空では登録できない' do
        @user.sending_kana_for_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Sending kana for last name can't be blank"
      end
      it 'sending_kana_for_last_nameが(漢字・ひらがな・カタカナ)でないと登録できない' do
        @user.sending_kana_for_last_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Sending kana for last name は全角カタカナで入力してください'
      end
      it 'date_of_birthが空では登録できない' do
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
