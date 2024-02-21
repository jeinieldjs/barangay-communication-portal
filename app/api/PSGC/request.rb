require 'json'
require 'rest-client'

module PSGC
  class Request
    BASE_URL = 'https://psgc.gitlab.io/api'

    def self.call(http_method:, endpoint:, params: {})
      url = "#{BASE_URL}#{endpoint}"

      result = RestClient::Request.execute(
        method: http_method,
        url: url,
        headers: {'Content-Type' => 'application/json'},
        payload: params.to_json
      )
      { code: result.code, status: 'Success', data: JSON.parse(result.body) }  
    rescue RestClient::ExceptionWithResponse => error 
        { code: error.http_code, status: error.message, data: Errors.map(error.http_code) }
    end
  end
end