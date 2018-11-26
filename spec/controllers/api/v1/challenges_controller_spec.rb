require 'rails_helper'

RSpec.describe Api::V1::ChallengesController, type: :controller do

  describe "GET #get" do
    it "returns http success" do
      get :get
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #set" do
    it "returns http success" do
      get :set
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    it "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #delete" do
    it "returns http success" do
      get :delete
      expect(response).to have_http_status(:success)
    end
  end

end
