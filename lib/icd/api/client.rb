# frozen_string_literal: true

require 'icd/api/version'
require 'icd/api/options'
require 'icd/api/connection'
require 'icd/api/entity'

require 'faraday'
require 'json'

module Icd
  module Api
    class Client
      def initialize(client_id:, client_secret:, **options)
        @client_id = client_id
        @client_secret = client_secret
        @options = Options.new(options)
      end

      def search(term)
        response = connection.get('search',
                                  {
                                    q: term,
                                    **api_default_params
                                  })

        response.body['destinationEntities'].map do |entity|
          Entity.new(entity)
        end
      end

      def fetch_stem_id_by_code(code)
        response = connection.get("codeinfo/#{code}", { flexiblemode: 'false' })

        response.body['stemId']
      end

      def fetch_info_by_stem_id(stem_id)
        entity_id = stem_id.split('/').last
        entity_id = stem_id.split('/')[-2] if entity_id == 'unknown'
        response = connection.get(entity_id, {})
        response.body
      end

      private

      def api_default_params
        { subtreeFilterUsesFoundationDescendants: 'false',
          includeKeywordResult: 'true',
          useFlexisearch: 'false',
          flatResults: 'false',
          highlightingEnabled: 'false',
          includePostcoordination: 'true' }
      end

      def connection
        Connection.new(@client_id, @client_secret, @options)
      end
    end
  end
end
