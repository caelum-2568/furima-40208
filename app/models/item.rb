class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # テーブルとのアソシエーション
  belongs_to :user

  # active_storageとのアソシエーション
  has_one_attached :image

  # アクティブハッシュとのアソシエーション
  belongs_to :category
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :product_condition
  belongs_to :shipping_day
 
  # バリデーション
  with_options presence: true do
    validates :user_id
    validates :image
    validates :item_name
    validates :explanation 
    validates :category_id
    validates :grade_id
    validates :postage_id
    validates :date_of_shipment_id
    validates :prefecture_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
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
