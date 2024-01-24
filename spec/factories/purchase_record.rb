FactoryBot.define do
  factory :purchase_record do
    user_id          { create(:user).id }
    item_id          { create(:item).id }
    post_code        {'123-4567'}
    prefecture_id    {3}
    municipalities   {'港区'}
    street_address   {'1-1-1'}
    building_name    {''}
    telephone_number {'09012345678'} 
    token            {'tok_abcdefghijk00000000000000000'}
  end
end
