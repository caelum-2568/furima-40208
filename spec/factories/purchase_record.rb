FactoryBot.define do
  factory :purchase_record do
    post_code        {'123-4567'}
    prefecture_id    {3}
    municipalities   {'港区'}
    street_address   {'1-1-1'}
    building_name    {''}
    telephone_number {'09012345678'} 
    token            {'tok_abcdefghijk00000000000000000'}
  end
  trait :with_building_name do
    building_name  {'ビル名'}
  end
  trait :without_building_name do
    building_name  {''}
  end
end
