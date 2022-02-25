# frozen_string_literal: true

require "icd/api/version"
require "icd/api/options"
require "icd/api/connection"
require "icd/api/entity"

require "faraday"
require "json"

module Icd
  module Api
    class Client
      def initialize(client_id:, client_secret:, **_options)
        @client_id = client_id
        @client_secret = client_secret
        @options = Options.new
      end

      def search(term)
        response = connection.get("search",
                                  {
                                    q: term,
                                    subtreeFilterUsesFoundationDescendants: "false",
                                    includeKeywordResult: "true",
                                    useFlexisearch: "false",
                                    flatResults: "false",
                                    highlightingEnabled: "false",
                                    includePostcoordination: "true"
                                  })

        response.body["destinationEntities"].map do |entity|
          Entity.new(entity)
        end
      end

      def fetch_by_code(code)
        response = connection.get("codeinfo/#{code}", { flexiblemode: "false" })

        stem_id = response.body["stemId"].split("/").last
        connection.get(stem_id.to_s, {})
      end

      private

      def connection
        Connection.new(@client_id, @client_secret, @options)
      end
    end
  end
end
