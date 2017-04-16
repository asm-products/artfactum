FactoryGirl.define do
  factory :user do
    username 'artfactum'
    email { Faker::Internet.email }
    password 'artfactum'
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    avatar_url { Faker::Internet.url }
  end
end
