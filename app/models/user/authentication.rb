class User
  class Authentication < ActiveRecord::Base
    belongs_to :user
    belongs_to :provider
    serialize :params

    def self.create_from_omniauth(params, user, provider)
      if params['credentials']['expires_at']
        token_expires_at =
          Time.at(params['credentials']['expires_at']).to_datetime
      end

      create(user: user,
             provider: provider,
             uid: params['uid'],
             token: params['credentials']['token'],
             token_expires_at: token_expires_at,
             params: params)
    end
  end
end
