require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  before do
    @user ||= create :user
    sign_in @user
    @category = create(:category)
    @artwork = create(:artwork, user: @user, category: @category)
  end

  it { should use_before_action(:authenticate_user!) }

  describe '#show' do
    context 'when category is found' do
      before { get :show, category_id: @category.id }
      it { expect(assigns(:category)).to eq(@category) }
      it { expect(assigns(:artworks).first).to eq(@artwork) }
      it { is_expected.to respond_with 200 }
      it { is_expected.to render_template :show }
    end
    context 'when category is not found' do
      before { get :show, category_id: -1 }
      it { is_expected.to respond_with 404 }
      it { is_expected.to render_template 'shared/not_found' }
    end
  end
end
