FactoryBot.define do
    factory :ingredient do
      name { Faker::Lorem.word }
      measurement { Faker::Number.number(digits: 2).to_s + " ml" }
      cocktail
    end
  end
  