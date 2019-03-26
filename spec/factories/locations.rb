
FactoryBot.define do
  places = ['NYC', 'Toronto', 'Alabama', 'Amsterdam', 'Paris']
  factory :location do
    name { places.sample }
  end
end
