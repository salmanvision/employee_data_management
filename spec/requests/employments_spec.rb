require 'rails_helper'

RSpec.describe "Employments", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/employments/create"
      expect(response).to have_http_status(:success)
    end
  end

end
