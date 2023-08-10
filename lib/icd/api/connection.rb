# frozen_string_literal: true

module Icd
  module Api
    class Connection
      attr_reader :options

      def initialize(options: Options.new)
        @options = options
      end

      def get(endpoint, params)
        connection.get("#{api_path}/#{endpoint}", params)
      end

      private

      def connection
        @connection ||= Faraday.new(url: options.root_url, headers: headers) do |faraday|
          faraday.adapter Faraday.default_adapter
          faraday.response :json
          faraday.request :json
        end
      end

      def api_path
        "/icd/release/#{options.revision}/#{options.release_id}/#{options.linearization_name}"
      end

      def headers
        { accept: 'application/json', 'API-Version' => 'v2', 'Accept-Language' => 'en',
          'Authorization' => "Bearer #{access_token.token}" }
      end

      def access_token
        AuthorizeToken.call
      end
    end
  end
end
