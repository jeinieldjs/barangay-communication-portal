require 'rails_helper'

RSpec.describe "Resident::Dashboards", type: :request do
  include Devise::Test::IntegrationHelpers
  fixtures :users

  before do
    @user = users(:user2)
    sign_in @user
  end

  describe "GET /index" do
    it "returns http success" do
      get resident_dashboard_index_url
      expect(response).to have_http_status(:success)
    end
  end
end
