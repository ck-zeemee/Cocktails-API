FactoryBot.define do
    factory :cocktail do
      name { Faker::Lorem.word }
      category { Faker::Lorem.word }
      container { Faker::Lorem.word }
      instructions { Faker::Lorem.sentence }
      image { "https://www.thecocktaildb.com/images/media/drink/uqwuyp1454514591.jpg" }
    end
  end
  