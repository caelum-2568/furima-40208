class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A(?:\p{Han}|\p{Hiragana}|\p{Katakana})+\z/u, message: "は全角（漢字・ひらがな・カタカナ）で入力してください" }
  validates :first_name, presence: true, format: { with: /\A(?:\p{Han}|\p{Hiragana}|\p{Katakana})+\z/u, message: "は全角（漢字・ひらがな・カタカナ）で入力してください" }
  validates :sending_kana_for_first_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください" }
  validates :sending_kana_for_last_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください" }
  validates :date_of_birth, presence: true
  validates :password, format: { with: /\A(?=.*[0-9])(?=.*[a-zA-Z])[0-9a-zA-Z]+\z/, message: "は半角英数字混合で入力してください" }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
