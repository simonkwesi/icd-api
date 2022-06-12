# frozen_string_literal: true

require 'icd/api/access_token'

module Icd
  module Api
    class Authorizer
      TOKEN_ENDPOINT = 'https://icdaccessmanagement.who.int/connect/token'
      SCOPE = 'icdapi_access'
      GRANT_TYPE = 'client_credentials'

      def initialize(client_id:, client_secret:)
        @client_id = client_id
        @client_secret = client_secret
      end

      def retrieve_access_token
        response = http_adapter.post TOKEN_ENDPOINT,
                                     {
                                       scope: SCOPE,
                                       grant_type: GRANT_TYPE,
                                       client_id: @client_id,
                                       client_secret: @client_secret
                                     }

        AccessToken.new(::JSON.parse(response.body))
      end

      def http_adapter
        Faraday.new
      end
    end
  end
end
