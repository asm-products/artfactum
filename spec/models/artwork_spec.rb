require 'rails_helper'

RSpec.describe Artwork, type: :model do
  subject { create(:artwork) }

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:gallery) }
    it { is_expected.to have_many(:attachments) }
  end
  describe 'attributes' do
    it { is_expected.to respond_to(:title) }
    it { is_expected.to respond_to(:description) }
  end
  describe 'validation' do
    it { is_expected.to validate_presence_of(:title) }
  end
end
