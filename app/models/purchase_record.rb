class PurchaseRecord
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipalities, :street_address, :building_name, :telephone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipalities
    validates :street_address
    validates :telephone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
    validates :token
  end

  def save
    ActiveRecord::Base.transaction do
      user_item = UserItem.create!(user_id: user_id, item_id: item_id)
      Address.create!(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, street_address: street_address, building_name: building_name, telephone_number: telephone_number, user_item_id: user_item.id)
      true
    end
  rescue ActiveRecord::RecordInvalid
    false
  end    
end
