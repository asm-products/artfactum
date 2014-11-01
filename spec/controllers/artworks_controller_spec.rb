require 'rails_helper'

RSpec.describe ArtworksController, type: :controller do
  before do
    @user ||= create :user
    sign_in @user
    @artwork = create(:artwork, user: @user)
  end

  it { should use_before_action(:authenticate_user!) }

  describe '#index' do
    before { get :index }
    it { expect(assigns(:artworks)).to be_decorated }
    it { expect(assigns(:artworks).first).to eq(@artwork) }
    it { is_expected.to respond_with 200 }
    it { is_expected.to render_template :index }
  end

  describe '#show' do
    context 'when artwork is found' do
      before { get :show, id: @artwork }
      it { expect(assigns(:artwork)).to be_decorated }
      it { expect(assigns(:artwork)).to eq(@artwork) }
      it { is_expected.to respond_with 200 }
      it { is_expected.to render_template :show }
    end
    context 'when artwork is not found' do
      before { get :show, id: -1 }
      it { is_expected.to respond_with 404 }
      it { is_expected.to render_template 'shared/not_found' }
    end
  end

  describe '#new' do
    before { get :new }
    it { expect(assigns(:artwork)).to be_decorated }
    it { expect(assigns(:artwork)).to_not be_persisted }
    it { is_expected.to render_template :new }
    it { is_expected.to respond_with 200 }
  end

  describe '#create' do
    context 'when new artwork is valid' do
      before { post :create, artwork: attributes_for(:artwork) }
      it { expect(assigns(:artwork)).to be_valid }
      it { expect(assigns(:artwork)).to be_persisted }
      it { is_expected.to redirect_to(artwork_path assigns(:artwork)) }
      it { is_expected.to respond_with 302 }
      it { is_expected.to set_the_flash[:success] }
    end
    context 'when new artwork is invalid' do
      before { post :create, artwork: attributes_for(:artwork, title: nil) }
      it { expect(assigns(:artwork)).to be_decorated }
      it { expect(assigns(:artwork)).to_not be_valid }
      it { expect(assigns(:artwork)).to_not be_persisted }
      it { is_expected.to render_template :new }
      it { is_expected.to respond_with 200 }
      it { is_expected.to set_the_flash[:error].now }
    end
  end

  describe '#edit' do
    context 'when artwork is found' do
      before { get :edit, id: @artwork }
      it { expect(assigns(:artwork)).to be_decorated }
      it { expect(assigns(:artwork)).to eq(@artwork) }
      it { is_expected.to respond_with 200 }
      it { is_expected.to render_template :edit }
    end
    context 'when artwork is not found' do
      before { get :show, id: -1 }
      it { is_expected.to respond_with 404 }
      it { is_expected.to render_template 'shared/not_found' }
    end
  end

  describe '#update' do
    context 'when artwork is found' do
      context 'when artwork update is valid' do
        before { put :update, id: @artwork, artwork: attributes_for(:artwork) }
        it { expect(assigns(:artwork)).to be_valid }
        it { expect(assigns(:artwork)).to be_persisted }
        it { is_expected.to redirect_to(artwork_path assigns(:artwork)) }
        it { is_expected.to respond_with 302 }
        it { is_expected.to set_the_flash[:success] }
      end
      context 'when artwork update is invalid' do
        before do
          put :update,
              id: @artwork,
              artwork: attributes_for(:artwork, title: nil)
        end
        it { expect(assigns(:artwork)).to_not be_valid }
        it { expect(assigns(:artwork)).to be_decorated }
        it { is_expected.to render_template :edit }
        it { is_expected.to respond_with 200 }
        it { is_expected.to set_the_flash[:error].now }
      end
    end
    context 'when artwork is not found' do
      before { put :update, id: -1 }
      it { is_expected.to respond_with 404 }
      it { is_expected.to render_template 'shared/not_found' }
    end
  end

  describe '#destroy' do
    context 'when artwork is found' do
      before { delete :destroy, id: @artwork }
      it { expect(assigns(:artwork)).to_not be_persisted }
      it { is_expected.to redirect_to(artworks_path) }
      it { is_expected.to respond_with 302 }
      it { is_expected.to set_the_flash[:info] }
    end
    context 'when artwork is not found' do
      before { delete :destroy, id: -1 }
      it { is_expected.to respond_with 404 }
      it { is_expected.to render_template 'shared/not_found' }
    end
  end
end
