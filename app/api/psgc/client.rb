require_relative 'request'

module PSGC
    class Client
        def self.fetch_provinces
            response = Request.call(http_method: 'get', endpoint: "/provinces/" )
        end

        def self.fetch_cities_municipalities(province_code)
            response = Request.call(http_method: 'get', endpoint: "/provinces/#{province_code}/cities-municipalities" )
        end

        def self.fetch_barangays(city_or_municipality_code)
            response = Request.call(http_method: 'get', endpoint: "/cities-municipalities/#{city_or_municipality_code}/barangays" )
        end

        def self.fetch_province province_code
            response = Request.call(http_method: 'get', endpoint: "/provinces/#{province_code}")
        end

        def self.fetch_city_municipality city_or_municipality_code
            response = Request.call(http_method: 'get', endpoint: "/cities-municipalities/#{city_or_municipality_code}")
        end

        def self.fetch_barangay barangay_code
            response = Request.call(http_method: 'get', endpoint: "/barangays/#{barangay_code}")
        end
    end
end
