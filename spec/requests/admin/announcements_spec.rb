require 'rails_helper'

RSpec.describe "Admin::Announcements", type: :request do
  include Devise::Test::IntegrationHelpers
  fixtures :users, :complaints

  before do
    @user = users(:user1)
    sign_in @user
  end

  describe "GET /index" do
    it "returns http success" do
      get admin_announcements_url
      expect(response).to have_http_status(:success)
    end
  end
end
