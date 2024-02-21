require 'rails_helper'

RSpec.describe "Resident::Likes", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/resident/likes/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/resident/likes/destroy"
      expect(response).to have_http_status(:success)
    end
  end
end
