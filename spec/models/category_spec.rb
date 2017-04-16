require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { create(:category) }

  describe 'associations' do
    it { is_expected.to have_many(:artworks) }
    it { is_expected.to have_many(:sub_categories) }
  end
  describe 'attributes' do
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:slug) }
  end
  describe 'validation' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:slug) }
  end
end
