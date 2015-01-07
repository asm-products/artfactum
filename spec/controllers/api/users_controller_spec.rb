require 'rails_helper'

describe Api::UsersController, :type => :controller do
  context "with a valid user" do
    let!(:user) { create(:user) }
    it "should be able to show the user" do
      api_get :show, id: user.id
      expect(json_response["first_name"]).to eq user.first_name
    end
  end
end
