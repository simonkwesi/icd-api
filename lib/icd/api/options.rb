# frozen_string_literal: true

module Icd
  module Api
    class Options
      # see https://id.who.int/swagger/index.html
      # and https://icd.who.int/docs/icd-api/SupportedClassifications/
      DEFAULT_API_ROOT_URL        = 'https://id.who.int'
      DEFAULT_LANGUAGE            = 'en'
      DEFAULT_LINEARIZATION_NAME  = 'mms'
      DEFAULT_RELEASE_ID          = '2023-01'
      DEFAULT_REVISION            = '11'

      def initialize(options = {})
        @options = options
      end

      def language
        @options[:language] ||= DEFAULT_LANGUAGE
      end

      def linearization_name
        @options[:linearization_name] ||= DEFAULT_LINEARIZATION_NAME
      end

      def release_id
        @options[:release_id] ||= DEFAULT_RELEASE_ID
      end

      def revision
        DEFAULT_REVISION
      end

      def root_url
        @options[:root_url] ||= DEFAULT_API_ROOT_URL
      end
    end
  end
end
