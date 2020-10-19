FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    gimei = Gimei.name
    lname { gimei.last.kanji }
    fname { gimei.first.kanji }
    lname_katakana { gimei.last.katakana }
    fname_katakana { gimei.first.katakana }
    birth_date { Faker::Date.birthday(min_age: 5, max_age: 90) }
  end
end
