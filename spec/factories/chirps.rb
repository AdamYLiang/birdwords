FactoryBot.define do
  factory :chirp do
    body { 'this is a chirp :)' }
    association :author, factory: :user
  end
end