FactoryBot.define do
  factory :item do
    user { create(:user) }
    item_name            { Faker::Name.name }
    explanation          { Faker::Lorem.sentence }
    category_id          { Faker::Number.between(from: 1, to: 10) }
    grade_id             { Faker::Number.between(from: 1, to: 6) }
    postage_id           { Faker::Number.between(from: 1, to:2) }
    date_of_shipment_id  { Faker::Number.between(from: 1, to: 3) }
    prefecture_id        { Faker::Number.between(from: 1, to: 47) }
    price                { Faker::Number.between(from: 300, to: 9_999_999) }
    image                { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'test_image.png'), 'image/png') }
  end
end