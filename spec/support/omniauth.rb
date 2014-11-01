OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
  provider: 'facebook',
  uid: SecureRandom.urlsafe_base64(nil, false),
  info: {
    email: Faker::Internet.email,
    name: Faker::Name.name,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    image: Faker::Internet.url,
    verified: true
  },
  credentials: {
    token: SecureRandom.urlsafe_base64(nil, false),
    expires_at: Time.now + 30.days,
    expires: true
  }
)
OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
  provider: 'google_oauth2',
  uid: SecureRandom.urlsafe_base64(nil, false),
  info: {
    email: Faker::Internet.email,
    name: Faker::Name.name,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    image: Faker::Internet.url
  },
  credentials: {
    token: SecureRandom.urlsafe_base64(nil, false),
    expires_at: Time.now + 30.days,
    expires: true
  }
)
OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new(
  provider: 'twitter',
  uid: SecureRandom.urlsafe_base64(nil, false),
  info: {
    nickname: Faker::Name.first_name.downcase,
    name: Faker::Name.name,
    image: Faker::Internet.url,
    description: Faker::Lorem.sentence,
    location: Faker::Lorem.sentence
  },
  credentials: {
    token: SecureRandom.urlsafe_base64(nil, false),
    secret: SecureRandom.urlsafe_base64(nil, false)
  }
)
