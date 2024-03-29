class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :user_item,         null: false, foreign_key: true
      t.string     :post_code,         null: false
      t.integer    :prefecture_id,     null: false
      t.string     :municipalities,    null: false
      t.string     :street_address,    null: false
      t.string     :building_name
      t.string     :telephone_number,  null: false
      t.timestamps
    end
  end
end
