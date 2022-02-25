# frozen_string_literal: true

module Icd
  module Api
    class Entity
      attr_reader :code, :title

      def initialize(body)
        @code = body['theCode']
        @title = body['title']
      end

      def to_s
        "#{code} #{title}"
      end
    end
  end
end
