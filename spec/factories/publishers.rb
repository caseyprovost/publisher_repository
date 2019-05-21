FactoryBot.define do
  factory :publisher do
    name { Faker::Company.name }
    description { Faker::Movies::HarryPotter.quote }
  end
end
