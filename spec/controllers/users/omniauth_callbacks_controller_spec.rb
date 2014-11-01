require 'rails_helper'

RSpec.describe Users::OmniauthCallbacksController, type: :controller do
  before do
    request.env['devise.mapping'] = Devise.mappings[:user]
  end
  context 'new user' do
    describe 'via facebook' do
      before do
        @provider = create(:provider, name: 'facebook')
        request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]
      end
      it 'creates a new user' do
        expect { get :facebook }.to change { User.count }.by(1)
      end
      it 'creates a new authentication' do
        expect { get :facebook }.to change { User::Authentication.count }.by(1)
        user_auth = User::Authentication.first
        expect(user_auth.provider).to eq(@provider)
        expect(user_auth.params).to eq(request.env['omniauth.auth'])
      end
    end
    describe 'via twitter' do
      before do
        @provider = create(:provider, name: 'twitter')
        request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
      end
      it 'creates a new user' do
        expect { get :twitter }.to change { User.count }.by(1)
      end
      it 'creates a new authentication' do
        expect { get :twitter }.to change { User::Authentication.count }.by(1)
        user_auth = User::Authentication.first
        expect(user_auth.provider).to eq(@provider)
        expect(user_auth.params).to eq(request.env['omniauth.auth'])
      end
    end
    describe 'via google_oauth2' do
      before do
        @provider = create(:provider, name: 'google_oauth2')
        request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
      end
      it 'creates a new user' do
        expect { get :google_oauth2 }.to change { User.count }.by(1)
      end
      it 'creates a new authentication' do
        expect { get :google_oauth2 }
          .to change { User::Authentication.count }.by(1)
        user_auth = User::Authentication.first
        expect(user_auth.provider).to eq(@provider)
        expect(user_auth.params).to eq(request.env['omniauth.auth'])
      end
    end
  end
  context 'returning user' do
    describe 'via facebook' do
      let(:hash) { OmniAuth.config.mock_auth[:facebook] }
      before do
        provider = create(:provider, name: 'facebook')
        request.env['omniauth.auth'] = hash
        user = User.create_from_omniauth(hash)
        User::Authentication.create_from_omniauth(hash, user, provider)
      end
      it 'uses existing user' do
        expect { get :facebook }.to change { User.count }.by(0)
      end
      it 'uses existing authentication' do
        expect { get :facebook }.to change { User::Authentication.count }.by(0)
      end
    end
    describe 'via twitter' do
      let(:hash) { OmniAuth.config.mock_auth[:twitter] }
      before do
        provider = create(:provider, name: 'twitter')
        request.env['omniauth.auth'] = hash
        user = User.create_from_omniauth(hash)
        User::Authentication.create_from_omniauth(hash, user, provider)
      end
      it 'uses existing user' do
        expect { get :twitter }.to change { User.count }.by(0)
      end
      it 'uses existing authentication' do
        expect { get :twitter }.to change { User::Authentication.count }.by(0)
      end
    end
    describe 'via google_oauth2' do
      let(:hash) { OmniAuth.config.mock_auth[:google_oauth2] }
      before do
        provider = create(:provider, name: 'google_oauth2')
        request.env['omniauth.auth'] = hash
        user = User.create_from_omniauth(hash)
        User::Authentication.create_from_omniauth(hash, user, provider)
      end
      it 'uses existing user' do
        expect { get :google_oauth2 }.to change { User.count }.by(0)
      end
      it 'uses existing authentication' do
        expect { get :google_oauth2 }
          .to change { User::Authentication.count }.by(0)
      end
    end

  end
  context 'returning user with alternate social profile' do
    describe 'facebook to google_oauth2' do
      before do
        hash = OmniAuth.config.mock_auth[:facebook]
        provider = create(:provider, name: 'facebook')
        create(:provider, name: 'google_oauth2')
        user = User.create_from_omniauth(hash)
        User::Authentication.create_from_omniauth(hash, user, provider)
        request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
        request.env['omniauth.auth']['info']['email'] = hash['info']['email']
      end
      it 'uses existing user' do
        expect { get :google_oauth2 }.to change { User.count }.by(0)
      end
      it 'creates a new authentication' do
        expect { get :google_oauth2 }
          .to change { User::Authentication.count }.by(1)
      end
    end
    describe 'google_oauth2 to facebook' do
      before do
        hash = OmniAuth.config.mock_auth[:google_oauth2]
        provider = create(:provider, name: 'google_oauth2')
        create(:provider, name: 'facebook')
        user = User.create_from_omniauth(hash)
        User::Authentication.create_from_omniauth(hash, user, provider)
        request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]
        request.env['omniauth.auth']['info']['email'] = hash['info']['email']
      end
      it 'uses existing user' do
        expect { get :facebook }.to change { User.count }.by(0)
      end
      it 'creates a new authentication' do
        expect { get :facebook }
          .to change { User::Authentication.count }.by(1)
      end
    end
  end
end
