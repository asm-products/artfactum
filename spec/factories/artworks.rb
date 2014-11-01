FactoryGirl.define do
  factory :artwork do
    user
    title { Faker::App.name }
    factory :full_artwork do

    end
  end
end
