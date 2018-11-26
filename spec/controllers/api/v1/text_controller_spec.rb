require 'rails_helper'

RSpec.describe Api::V1::TextController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destory" do
    it "returns http success" do
      get :destory
      expect(response).to have_http_status(:success)
    end
  end

end
