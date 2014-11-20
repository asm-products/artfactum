require 'rails_helper'

RSpec.describe Tagging, type: :model do
  subject { create(:tagging) }

  describe 'associations' do
    it { is_expected.to belong_to(:tag) }
    it { is_expected.to belong_to(:artwork) }
  end
  describe 'validation' do
    it { is_expected.to validate_presence_of(:tag) }
    it { is_expected.to validate_presence_of(:artwork) }
  end
end
