FactoryGirl.define do
  factory :authentication, class: User::Authentication do
    user
    provider
    uid { SecureRandom.urlsafe_base64(nil, false) }
    token { SecureRandom.urlsafe_base64(nil, false) }
    token_expires_at { Time.now + 30.days }
  end
end
