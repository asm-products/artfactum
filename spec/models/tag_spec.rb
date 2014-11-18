require 'rails_helper'

RSpec.describe Tag, type: :model do
  subject { create(:tag) }

  describe 'associations' do
    it { is_expected.to have_many(:taggings) }
    it { is_expected.to have_many(:artworks).through(:taggings) }
  end
  describe 'attributes' do
    it { is_expected.to respond_to(:name) }
  end
  describe 'validation' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
