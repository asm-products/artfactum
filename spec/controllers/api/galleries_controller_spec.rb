require 'rails_helper'

describe Api::GalleriesController, :type => :controller do
  context "with valid galleries" do
    let!(:gallery1) { create(:gallery) }
    let!(:gallery2) { create(:gallery) }

    it "should be able to index the galleries" do
      api_get :index
      expect(json_response.size).to eq(2)
    end
    it "should be able to show the gallery" do
      api_get :show, id: gallery1.id
      expect(json_response["title"]).to eq gallery1.title
    end
  end
end
