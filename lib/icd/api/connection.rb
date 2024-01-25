# frozen_string_literal: true

require 'icd/api/authorizer'

module Icd
  module Api
    class Connection
      attr_reader :options

      def initialize(client_id, client_secret, options)
        @options = options
        @client_id = client_id
        @client_secret = client_secret
      end

      def get(endpoint, params)
        connection.get("#{api_path}/#{endpoint}", params)
      end

      private

      def connection
        @connection ||= Faraday.new(url: options.root_url, headers:) do |faraday|
          faraday.adapter Faraday.default_adapter
          faraday.response :json
          faraday.request :json
        end
      end

      def api_path
        "/icd/release/#{options.revision}/#{options.release_id}/#{options.linearization_name}"
      end

      def headers
        { accept: 'application/json', 'API-Version' => 'v2', 'Accept-Language' => options.language.to_s,
          'Authorization' => "Bearer #{access_token.token}" }
      end

      def access_token
        Authorizer.new(client_id: @client_id, client_secret: @client_secret).retrieve_access_token
      end
    end
  end
end
