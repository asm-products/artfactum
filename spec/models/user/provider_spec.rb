require 'rails_helper'

RSpec.describe User::Provider, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:authentications).dependent(:destroy) }
  end
  describe 'seeds' do
    before do
      load Rails.root + 'db/seeds.rb'
    end
    it 'creates facebook provider' do
      expect(User::Provider.find_by name: 'facebook').to_not be_nil
    end
    it 'creates google_oauth2 provider' do
      expect(User::Provider.find_by name: 'google_oauth2').to_not be_nil
    end
    it 'creates twitter provider' do
      expect(User::Provider.find_by name: 'twitter').to_not be_nil
    end
  end
end
