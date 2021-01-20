FactoryBot.define do
  factory :event do
    title { Faker::Creature::Cat.registry }
    date { Date.today }
  end
end
