require 'rails_helper'

RSpec.describe "Api::Psgcs", type: :request do
  describe "GET /fetch_provinces" do
    it "returns http success" do
      get "/api/psgc/fetch_provinces"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /fetch_cities_municipalities" do
    province_code = '043400000'
    it "returns http success" do
      get "/api/psgc/fetch_cities_municipalities/#{province_code}"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /fetch_barangays" do
    city_or_municipality_code = '043405000'
    it "returns http success" do
      get "/api/psgc/fetch_barangays/#{city_or_municipality_code}"
      expect(response).to have_http_status(:success)
    end
  end

end
