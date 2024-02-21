class Api::PsgcController < ApplicationController
    def fetch_provinces
        provinces = PSGC::Client.fetch_provinces
        render json: provinces
      end
    
      def fetch_cities_municipalities
        province_code = params[:province_code]
        cities_municipalities = PSGC::Client.fetch_cities_municipalities(province_code)
        render json: cities_municipalities
      end
    
      def fetch_barangays
        city_or_municipality_code = params[:city_or_municipality_code]
        barangays = PSGC::Client.fetch_barangays(city_or_municipality_code)
        render json: barangays
      end
end
