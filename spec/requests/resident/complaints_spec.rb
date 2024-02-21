require 'rails_helper'

RSpec.describe "Resident::Complaints", type: :request do
  include Devise::Test::IntegrationHelpers
  fixtures :users

  before do
    @user = users(:user2)
    sign_in @user
  end

  describe "GET /index" do
    it "returns http success" do
      get resident_complaints_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get new_resident_complaint_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "creates a new complaint" do
      post resident_complaints_path, params: { complaint: { subject: "Sample", description: "This is a sample complaint." } }
      expect(response).to have_http_status(:redirect)
    end
  end

end
