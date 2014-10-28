module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
      create
    end

    def twitter
      create
    end

    def google_oauth2
      create
    end

    protected

    def after_omniauth_failure_path_for(_scope)
      root_path
    end

    def create(hash = request.env['omniauth.auth'])
      provider = User::Provider.find_by(name: hash.provider)
      auth = provider.authentications.find_by(uid: hash.uid)
      user = User.find_by(email: hash['info']['email'])

      return sign_in_existing_user_with_authentication(auth) if auth
      return sign_in_existing_user(hash, user, provider) if user
      sign_in_new_user(hash, provider)
    end

    def sign_in_existing_user_with_authentication(authentication)
      sign_in_and_redirect(:user, authentication.user)
    end

    def sign_in_existing_user(auth_params, user, provider)
      User::Authentication.create_from_omniauth(auth_params, user, provider)
      sign_in_and_redirect(:user, user)
    end

    def sign_in_new_user(auth_params, provider)
      user = User.create_from_omniauth(auth_params)
      return sign_in_existing_user(auth_params, user, provider) if user.valid?
      flash[:error] = user.errors.full_messages.first
      redirect_to root_path
    end
  end
end
