require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe "GET /main" do
    it "returns http success" do
      get "/pages/main"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /personal_data" do
    it "returns http success" do
      get "/pages/personal_data"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /employment" do
    it "returns http success" do
      get "/pages/employment"
      expect(response).to have_http_status(:success)
    end
  end

end
