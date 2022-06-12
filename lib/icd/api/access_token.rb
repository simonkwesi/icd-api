# frozen_string_literal: true

module Icd
  module Api
    class AccessToken
      attr_reader :token, :expires_at

      def initialize(body)
        body.transform_keys!(&:to_sym)
        @expires_at = Time.now.utc + body[:expires_in].to_i
        @token = body[:access_token]
      end
    end
  end
end
