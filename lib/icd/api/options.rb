# frozen_string_literal: true

module Icd
  module Api
    class Options
      DEFAULT_RELEASE_ID          = '2022-02'
      DEFAULT_REVISION            = '11'
      DEFAULT_LINEARIZATION_NAME  = 'mms'
      DEFAULT_API_ROOT_URL        = 'https://id.who.int'

      def initialize(**options)
        @options = options
      end

      def release_id
        @options[:release_id] ||= DEFAULT_RELEASE_ID
      end

      def revision
        DEFAULT_REVISION
      end

      def linearization_name
        @options[:linearization_name] ||= DEFAULT_LINEARIZATION_NAME
      end

      def root_url
        @options[:root_url] ||= DEFAULT_API_ROOT_URL
      end
    end
  end
end
