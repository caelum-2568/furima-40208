# テーブル設計

## users テーブル
|Column                           |Type             |Options                           |
|---------------------------------|-----------------|----------------------------------|
|nickname                         |string           |null: false                       |
|email                            |string           |null: false , unique: true        |
|encrypted_password               |string           |null: false                       |
|last_name  # 苗字                 |string           |null: false                       |
|first_name  # 名前                |string           |null: false                       |
|sending_kana_for_first_name      |string           |null: false                       |
|sending_kana_for_last_name       |string           |null: false                       |
|date_of_birth                    |date             |null: false                       |
### Association
- has_many :uses_items  # uses_items テーブルとのアソシエーション
- has_many :items # items テーブルとのアソシエーション

## items テーブル
|Column                            |Type             |Options                           |
|----------------------------------|-----------------|----------------------------------|
|user                              |references       |null: false, foreign_key: true    |
|item_name                         |string           |null: false                       |
|explanation  # 説明文              |text             |null: false                       |
|category_id  # カテゴリー           |integer          |null: false                       |
|grade_id  # 商品の状態              |integer          |null: false                       |
|postage_id  # 送料                 |integer          |null: false                       |
|date_of_shipment_id  # 発送日      |integer          |null: false                       |
|prefecture_id  # 発送地域          |integer          |null: false                       |
|price                             |integer          |null: false                       |
### Association
- has_one :uses_item  # uses_items テーブルとのアソシエーション
- belongs_to :user  # users テーブルとのアソシエーション

## uses_items テーブル
|Column                           |Type             |Options                           |
|---------------------------------|-----------------|----------------------------------|
|user                             |references       |null: false, foreign_key: true    |
|item                             |references       |null: false, foreign_key: true    |
### Association
- belongs_to :user  # users テーブルとのアソシエーション
- belongs_to :item # items テーブルとのアソシエーション
- has_one :address  # addresses テーブルとのアソシエーション

## addresses テーブル
|Column                            |Type             |Options                           |
|----------------------------------|-----------------|----------------------------------|
|users_item                        |references       |null: false, foreign_key: true    |
|post_code  # 郵便番号              |string           |null: false                       |
|prefecture_id # 都道府県           |integer          |null: false                       |
|municipalities  # 市町村           |string           |null: false                       |
|street_address  # 番地             |string           |null: false                       |
|building_name  # 建物名            |string           |                                  |
|telephone_number  # 電話番号        |string           |null: false                      |
### Association
- belongs_to :uses_item  # uses_items テーブルとのアソシエーション

