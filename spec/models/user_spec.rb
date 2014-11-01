require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create(:user) }

  describe 'associations' do
    it { is_expected.to have_many(:authentications).dependent(:destroy) }
  end
  describe 'attributes' do
    it { is_expected.to respond_to(:email) }
    it { is_expected.to respond_to(:first_name) }
    it { is_expected.to respond_to(:last_name) }
    it { is_expected.to respond_to(:avatar_url) }
  end
  describe 'definitions' do
    describe 'self#create_from_omniauth' do
      context 'params are valid' do
        let(:user) { attributes_for(:user) }
        let(:params) { { info: user.dup } }
        before do
          params[:info][:image] = params[:info][:avatar_url]
          params[:info].delete(:avatar_url)
        end
        it 'creates a user' do
          expect { User.create_from_omniauth(params) }.to(
            change { User.count }.by(1)
          )
        end
        it 'assigns the correct attributes' do
          created_user = User.create_from_omniauth(params)
          expect(created_user.first_name).to eq(user[:first_name])
          expect(created_user.last_name).to eq(user[:last_name])
          expect(created_user.email).to eq(user[:email])
          expect(created_user.avatar_url).to eq(user[:avatar_url])
        end
        it 'handles empty email' do
          params[:info].delete(:email)
          created_user = User.create_from_omniauth(params)
          expect(created_user.email).to eq('')
        end
        it 'handles only name field' do
          params[:info][:name] = "#{user[:first_name]} #{user[:last_name]}"
          params[:info].delete(:first_name)
          params[:info].delete(:last_name)
          created_user = User.create_from_omniauth(params)
          expect(created_user.first_name).to eq(params[:info][:name])
        end
      end
      context 'params are invalid' do
        it 'fails gracefully' do
          expect(User.create_from_omniauth({})).to eq(false)
        end
      end
    end
  end

end
