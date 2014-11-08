FactoryGirl.define do
  factory :gallery do
    title { Faker::App.name }
    factory :full_gallery do
    end
  end
end
