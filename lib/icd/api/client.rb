# frozen_string_literal: true

require 'faraday'
require 'json'

module Icd
  module Api
    class Client
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
        connection
          .get("codeinfo/#{code}", { flexiblemode: 'false' })
          .body['stemId']
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
        Connection.new
      end
    end
  end
end
