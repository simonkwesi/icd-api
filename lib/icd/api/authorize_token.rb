# frozen_string_literal: true

module Icd
  module Api
    class AuthorizeToken
      extend Dry::Configurable
      TOKEN_ENDPOINT = 'https://icdaccessmanagement.who.int/connect/token'
      SCOPE = 'icdapi_access'
      GRANT_TYPE = 'client_credentials'

      setting :client_id, default: ENV['ICD_API_CLIENT_ID']
      setting :client_secret, default: ENV['ICD_API_CLIENT_SECRET']

      class << self
        attr_reader :access_token

        def call
          return @access_token if valid?

          response = http_adapter.post TOKEN_ENDPOINT,
                                       {
                                         scope: SCOPE,
                                         grant_type: GRANT_TYPE,
                                         client_id: config.client_id,
                                         client_secret: config.client_secret
                                       }

          @access_token = AccessToken.new(::JSON.parse(response.body))
        end

        private

        def valid?
          return false if @access_token.nil?

          @access_token.expires_at.to_i > Time.now.to_i
        end

        def http_adapter
          Faraday.new
        end
      end
    end
  end
end
