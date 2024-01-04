# テーブル設計

## users テーブル
|Column                           |Type             |Options                            |
|---------------------------------|-----------------|-----------------------------------|
|nickname                         |string           |null : false , unique : true       |
|email_address                    |string           |null : false , unique : true       |
|password                         |string           |null : false                       |
|name                             |string           |null : false                       |
|sending_kana                     |string           |null : false                       |
|date_of_birth                    |string           |null : false                       |
### Association
- belongs_to : uses_items  # uses_items テーブルとのアソシエーション
- belongs_to : purchases   # purchases テーブルとのアソシエーション
- has_many : items # items テーブルとのアソシエーション

## items テーブル
|Column                            |Type             |Options                            |
|----------------------------------|-----------------|-----------------------------------|
|image                             |image            |null : false                       |
|Item_name                         |string           |null : false                       |
|explanation  # 説明文              |text             |null : false                       |
|category  # カテゴリー              |string           |null : false                       |
|grade  # 商品の状態                 |string           |null : false                       |
|postage  # 送料                    |string           |null : false                       |
|date_of_shipment  # 発送日         |string           |null : false                       |
|price                             |string           |null : false                       |
### Association
- belongs_to : uses_items  # uses_items テーブルとのアソシエーション
- belongs_to : purchases  # purchases テーブルとのアソシエーション
- has_many : users  # users テーブルとのアソシエーション

## uses_items テーブル
|Column                           |Type             |Options                            |
|---------------------------------|-----------------|-----------------------------------|
|users_id                         |string           |null : false , unique : true       |
|items_id                         |string           |null : false , unique : true       |
### Association
- has_many : users  # users テーブルとのアソシエーション
- has_many : items # items テーブルとのアソシエーション

## purchases テーブル
|Column                            |Type             |Options                            |
|----------------------------------|-----------------|-----------------------------------|
|on_sale                           |string           |null : false                       |
|Item_name                         |string           |null : false                       |
|sold_out                          |string           |null : false                       |
### Association
- belongs_to : items  # items テーブルとのアソシエーション
- belongs_to : addresses  # addresses テーブルとのアソシエーション
- has_many : users  # users テーブルとのアソシエーション

## addresses テーブル
|Column                            |Type             |Options                            |
|----------------------------------|-----------------|-----------------------------------|
|post_code  # 郵便番号               |string           |null : false                       |
|prefectures # 都道府県              |string           |null : false                       |
|municipalities  # 市町村           |string           |null : false                       |
|street_address  # 番地             |string           |null : false                       |
|Building_name  # 建物名            |string           |                                   |
|telephone_number  # 電話番号        |string           |null : false                       |
### Association
- belongs_to : purchases  # purchases テーブルとのアソシエーション

