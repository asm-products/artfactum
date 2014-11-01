class User
  class Authentication < ActiveRecord::Base
    belongs_to :user
    belongs_to :provider
    validates :user, presence: true
    validates :provider, presence: true
    serialize :params

    def self.create_from_omniauth(params, user, provider)
      create(user: user,
             provider: provider,
             uid: params['uid'],
             token: params['credentials']['token'],
             token_expires_at:
               expiry_to_date(params['credentials']['expires_at']),
             params: params)
    rescue NoMethodError
      false
    end

    def self.expiry_to_date(expires_at)
      return unless expires_at
      Time.at(expires_at).to_datetime
    end
  end
end
