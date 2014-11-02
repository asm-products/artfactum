require 'rails_helper'

RSpec.describe GalleriesController, type: :controller do
  before do
    @user ||= create :user
    sign_in @user
    @gallery = create(:gallery, user: @user)
    @artwork = create(:artwork, user: @user, gallery: @gallery)
  end

  it { should use_before_action(:authenticate_user!) }

  describe '#index' do
    before { get :index }
    it { expect(assigns(:galleries)).to be_decorated }
    it { expect(assigns(:galleries).first).to eq(@gallery) }
    it { is_expected.to respond_with 200 }
    it { is_expected.to render_template :index }
  end

  describe '#show' do
    context 'when gallery is found' do
      before { get :show, id: @gallery }
      it { expect(assigns(:gallery)).to be_decorated }
      it { expect(assigns(:gallery)).to eq(@gallery) }
      it { expect(assigns(:artworks)).to be_decorated }
      it { expect(assigns(:artworks).first).to eq(@artwork) }
      it { is_expected.to respond_with 200 }
      it { is_expected.to render_template :show }
    end
    context 'when gallery is not found' do
      before { get :show, id: -1 }
      it { is_expected.to respond_with 404 }
      it { is_expected.to render_template 'shared/not_found' }
    end
  end

  describe '#new' do
    before { get :new }
    it { expect(assigns(:gallery)).to be_decorated }
    it { expect(assigns(:gallery)).to_not be_persisted }
    it { is_expected.to render_template :new }
    it { is_expected.to respond_with 200 }
  end

  describe '#create' do
    context 'when new gallery is valid' do
      before { post :create, gallery: attributes_for(:gallery) }
      it { expect(assigns(:gallery)).to be_valid }
      it { expect(assigns(:gallery)).to be_persisted }
      it { is_expected.to redirect_to(gallery_path assigns(:gallery)) }
      it { is_expected.to respond_with 302 }
      it { is_expected.to set_the_flash[:success] }
    end
    context 'when new gallery is invalid' do
      before { post :create, gallery: attributes_for(:gallery, title: nil) }
      it { expect(assigns(:gallery)).to be_decorated }
      it { expect(assigns(:gallery)).to_not be_valid }
      it { expect(assigns(:gallery)).to_not be_persisted }
      it { is_expected.to render_template :new }
      it { is_expected.to respond_with 200 }
      it { is_expected.to set_the_flash[:error].now }
    end
  end

  describe '#edit' do
    context 'when gallery is found' do
      before { get :edit, id: @gallery }
      it { expect(assigns(:gallery)).to be_decorated }
      it { expect(assigns(:gallery)).to eq(@gallery) }
      it { is_expected.to respond_with 200 }
      it { is_expected.to render_template :edit }
    end
    context 'when gallery is not found' do
      before { get :show, id: -1 }
      it { is_expected.to respond_with 404 }
      it { is_expected.to render_template 'shared/not_found' }
    end
  end

  describe '#update' do
    context 'when gallery is found' do
      context 'when gallery update is valid' do
        before { put :update, id: @gallery, gallery: attributes_for(:gallery) }
        it { expect(assigns(:gallery)).to be_valid }
        it { expect(assigns(:gallery)).to be_persisted }
        it { is_expected.to redirect_to(gallery_path assigns(:gallery)) }
        it { is_expected.to respond_with 302 }
        it { is_expected.to set_the_flash[:success] }
      end
      context 'when gallery update is invalid' do
        before do
          put :update,
              id: @gallery,
              gallery: attributes_for(:gallery, title: nil)
        end
        it { expect(assigns(:gallery)).to_not be_valid }
        it { expect(assigns(:gallery)).to be_decorated }
        it { is_expected.to render_template :edit }
        it { is_expected.to respond_with 200 }
        it { is_expected.to set_the_flash[:error].now }
      end
    end
    context 'when gallery is not found' do
      before { put :update, id: -1 }
      it { is_expected.to respond_with 404 }
      it { is_expected.to render_template 'shared/not_found' }
    end
  end

  describe '#destroy' do
    context 'when gallery is found' do
      before { delete :destroy, id: @gallery }
      it { expect(assigns(:gallery)).to_not be_persisted }
      it { is_expected.to redirect_to(galleries_path) }
      it { is_expected.to respond_with 302 }
      it { is_expected.to set_the_flash[:info] }
    end
    context 'when gallery is not found' do
      before { delete :destroy, id: -1 }
      it { is_expected.to respond_with 404 }
      it { is_expected.to render_template 'shared/not_found' }
    end
  end
end
