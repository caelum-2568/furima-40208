FactoryBot.define do
  factory :user do
    nickname                    { Faker::Name.initials }
    email                       { Faker::Internet.unique.email }
    password                    { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation       { password }
    first_name                  { 'あいう' }
    last_name                   { 'えおか' }
    sending_kana_for_first_name { 'アイウ' }
    sending_kana_for_last_name  { 'エオカ' }
    date_of_birth               { Faker::Date.birthday }
  end
end
