module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    before_action :authenticate, only: [:facebook, :twitter, :google_oauth2]

    def facebook
    end

    def twitter
    end

    def google_oauth2
    end

    def failure
      flash[:error] =
        params[:message] || 'There was a problem signing in with your account'
      redirect_to root_path
    end

    protected

    def authenticate(hash = request.env['omniauth.auth'])
      provider = User::Provider.find_by(name: hash.provider)
      sign_in_and_redirect :user, find_user_by_authentication(hash, provider)
    end

    def find_user_by_authentication(hash, provider)
      (provider.authentications.find_by(uid: hash.uid) ||
      User::Authentication.create_from_omniauth(hash, find_user(hash), provider)
      ).try(:user)
    end

    def find_user(hash)
      User.find_by(email: hash['info']['email']) ||
      User.create_from_omniauth(hash)
    end
  end
end
