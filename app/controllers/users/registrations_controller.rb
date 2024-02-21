class Users::RegistrationsController < Devise::RegistrationsController
    before_action :set_locations, only: [:new, :create]
    before_action :process_locations, only: [:create]
  
    private
  
    def process_locations
      params['user']['province'] = PSGC::Client.fetch_province(params['user']['province'])[:data]['name']
      params['user']['city_municipality'] = PSGC::Client.fetch_city_municipality(params['user']['city_municipality'])[:data]['name']
      params['user']['barangay'] = PSGC::Client.fetch_barangay(params['user']['barangay'])[:data]['name']
    end
  
    def set_locations
      response = PSGC::Client.fetch_provinces
      @provinces = response[:data].sort_by { |province| province["name"] }
    end
  end