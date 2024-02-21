require 'rails_helper'

RSpec.describe "Admin::Residents", type: :request do
  include Devise::Test::IntegrationHelpers
  fixtures :users

  before do
    @user = users(:user1)
    sign_in @user
  end
  
  describe "GET /index" do
    it "returns http success" do
      get admin_residents_url
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get new_admin_resident_url
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /admin/residents" do
    context "with valid parameters" do
      it "creates a new resident" do
        expect {
          post admin_residents_path, params: { user: {
            first_name: "John", last_name: "Doe", email: "john@doe.com", password: "password", password_confirmation: "password", complete_address: "Bgy. Hall", barangay: "Bucal", province: "Laguna", city_municipality: "City of Calamba", role: "resident", status: "approved", contact_number: "09012345678"
          }}
       }.to change(User, :count).by(1)
       expect(response).to have_http_status(:redirect)
       expect(response).to redirect_to(admin_residents_path)
      end
    end
  end

  describe "GET /show" do
    it "returns http success" do
      user = users(:user2)
      get admin_resident_path(user)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      user = users(:user2)
      get edit_admin_resident_path(user)
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH /admin/residents/:id" do
    it "updates the resident info" do
      user = users(:user2)
      patch admin_resident_path(user), params: { user: { first_name: "Updatedname" } }
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(admin_residents_path)
      expect(flash[:notice]).to eq("Resident's account was successfully updated.")
      user.reload
      expect(user.first_name).to eq("Updatedname")
    end
  end

  describe "DELETE /admin/residents/:id" do
    it "destroys the resident" do
      user = users(:user2)
      expect {
        delete admin_resident_path(user)
      }.to change(User, :count).by(-1)
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(admin_residents_path)
    end
  end
end
