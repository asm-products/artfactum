require 'rails_helper'

RSpec.describe User::Authentication, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:provider) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:provider) }
  end

  describe 'definitions' do
    it { is_expected.to serialize(:params) }
    describe 'self#create_from_omniauth' do
      let(:user) { create(:user) }
      let(:provider) { create(:provider) }
      context 'params are valid' do
        let(:authentication) { attributes_for(:authentication) }
        let(:params) do
          {
            'uid' => authentication[:uid],
            'credentials' => {
              'token' => authentication[:token],
              'expires_at' => authentication[:token_expires_at].to_i
            }
          }
        end
        it 'creates an authentication' do
          expect do
            User::Authentication.create_from_omniauth(params, user, provider)
          end.to change { User::Authentication.count }.by(1)
        end
        it 'assigns the correct attributes' do
          auth_object =
            User::Authentication.create_from_omniauth(params, user, provider)
          expect(auth_object.user).to eq(user)
          expect(auth_object.provider).to eq(provider)
          expect(auth_object.uid).to eq(authentication[:uid])
          expect(auth_object.token).to eq(authentication[:token])
          expect(auth_object.token_expires_at.to_i)
            .to eq(authentication[:token_expires_at].to_i)
          expect(auth_object.params).to eq(params)
        end
      end
      context 'params are invalid' do
        it 'fails gracefully' do
          expect(
            User::Authentication.create_from_omniauth(nil, user, provider))
          .to eq(false)
        end
      end
    end
    describe 'self#expiry_to_date' do
      context 'params are valid' do
        let(:time) { Time.now.to_i }
        it 'returns a datetime' do
          expect(User::Authentication.expiry_to_date(time)).to(
            be_instance_of(DateTime))
        end
      end
      context 'params are invalid' do
        it 'fails gracefully' do
          expect(User::Authentication.expiry_to_date(nil)).to eq(nil)
        end
      end
    end
  end
end
