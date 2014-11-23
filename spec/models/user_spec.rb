require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create(:user) }

  describe 'attributes' do
    it { is_expected.to respond_to(:username) }
    it { is_expected.to respond_to(:email) }
    it { is_expected.to respond_to(:first_name) }
    it { is_expected.to respond_to(:last_name) }
    it { is_expected.to respond_to(:avatar_url) }
  end
end
