class UserItem < ApplicationRecord
  belongs_to :user # users テーブルとのアソシエーション
  belongs_to :item # items テーブルとのアソシエーション
  has_one :address # addresses テーブルとのアソシエーション
end
