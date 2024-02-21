require 'rails_helper'

RSpec.describe "Admin::Complaints", type: :request do
  include Devise::Test::IntegrationHelpers
  fixtures :users, :complaints

  before do
    @user = users(:user1)
    sign_in @user
    @complaint = complaints(:complaint1)
  end

  describe "GET /index" do
    it "returns http success" do
      get admin_complaints_url
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      patch admin_complaint_url(@complaint), params: { complaint: { status: "resolved" } }
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(admin_complaints_path)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get admin_complaint_url(@complaint)
      expect(response).to have_http_status(:success)
    end

    it "renders the update status form" do
      get admin_complaint_path(@complaint)
      expect(response.body).to include('Update Status')
      expect(response.body).to include('pending')
      expect(response.body).to include('resolved')
    end
  end

end
