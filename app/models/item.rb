class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # テーブルとのアソシエーション
  has_one :user_item
  belongs_to :user

  # active_storageとのアソシエーション
  has_one_attached :image

  # アクティブハッシュとのアソシエーション
  belongs_to :category
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :grade
  belongs_to :date_of_shipment

  # バリデーション
  with_options presence: true do
    validates :image
    validates :item_name
    validates :explanation
    validates :category_id
    validates :grade_id
    validates :postage_id
    validates :date_of_shipment_id
    validates :prefecture_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }
  end

  # ジャンルの選択が「--」の時は保存不可
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :grade_id
    validates :postage_id
    validates :date_of_shipment_id
    validates :prefecture_id
  end
end
