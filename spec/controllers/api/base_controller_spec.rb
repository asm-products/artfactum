require 'rails_helper'

describe Api::BaseController, :type => :controller do

  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @request.env["HTTP_ACCEPT"] = "application/json"
    @request.env["CONTENT_TYPE"] = "application/json"
  end

  context "with a fake access point for the base controller" do
    controller(Api::BaseController) do
      def index
        render json: {"message" => "Ya got me"}
      end
    end

    describe "cannot make a request to the API" do
      it "without an API key" do
        api_get :index, {}, false
        expect(response.status).to eq(401)
        expect(json_response["error"]).to eq("Could not authenticate")
      end
      it "should fail on no API key" do
        api_get :index
        expect(response.status).to eq(401)
        expect(json_response["error"]).to eq("Could not authenticate")
      end
      it "with an invalid API key" do
        user = create(:user)
        allow(user).to receive(:api_token).with("fake_key")
        api_get :index
        expect(response.status).to eq(401)
        expect(json_response["error"]).to eq("Could not authenticate")
      end
    end

    context "with a valid account and API key" do
      let!(:user) { create(:user) }

      it "should allow API key in header" do
        api_get :index
        # Successfully accesses index page
        expect(response.status).to eq(200)
      end
      it "should have json content type" do
        api_get :index
        expect(response.header['Content-Type']).to include 'application/json'
      end
    end
  end
end
