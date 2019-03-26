# pluralized version of the model.

FactoryBot.define do
  years = [1992, 1990, 1945, 1818]

  factory :user do
    name { Faker::Movies::StarWars.character }
    password { 'starwars' }
    birth_year { years.sample }
    location { create(:location) } 
    # ^ referencing the association location on the user model.
  end
end
