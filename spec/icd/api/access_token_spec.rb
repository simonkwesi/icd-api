# frozen_string_literal: true

require 'spec_helper'

module Icd
  module Api
    RSpec.describe AccessToken do
      let(:token) do
        'Sometoken'
      end

      subject do
        described_class.new({ 'expires_in' => 4000, 'access_token' => token })
      end

      let(:time_now) { Time.now.utc }

      before do
        allow(Time).to receive_message_chain(:now, :utc).and_return(time_now)
      end

      describe '#token' do
        it 'equals `access_token` hash key value' do
          expect(subject.token).to eq token
        end
      end

      describe '#expires_at' do
        it 'is calculated based on `expires_in` hash key value' do
          expect(subject.expires_at).to eq time_now + 4000
        end
      end
    end
  end
end
