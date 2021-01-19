FactoryBot.define do
  factory :user do
    name { Faker::Name.male_first_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
