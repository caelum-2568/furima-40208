class Address < ApplicationRecord
  belongs_to :user_item  # user_item モデルとのアソシエーション
end
