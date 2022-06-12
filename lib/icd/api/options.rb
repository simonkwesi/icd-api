# frozen_string_literal: true

module Icd
  module Api
    class Options
      def initialize(**options)
        @options = options
      end

      def release_id
        @options[:release_id] ||= '2022-02'
      end

      def revision
        '11'
      end

      def linearization_name
        @options[:linearization_name] ||= 'mms'
      end

      def root_url
        @options[:root_url] ||= 'https://id.who.int'
      end
    end
  end
end
