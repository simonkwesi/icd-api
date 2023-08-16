# frozen_string_literal: true

require 'spec_helper'
module Icd
  module Api
    RSpec.describe Client do
      let(:client) do
        described_class.new
      end

      context 'Fetch by Code -- Good Value' do
        let(:response) do
          VCR.use_cassette('by_code_FB32.5') { client.fetch_stem_id_by_code('FB32.5') }
        end
        it 'returns required fields' do
          expect(response).to eq('http://id.who.int/icd/release/11/2022-02/mms/254923627')
        end
      end

      context 'Fetch by Code -- Deprecated ' do
        let(:response) do
          VCR.use_cassette('by_code_1F4Z') { client.fetch_stem_id_by_code('1F4Z') }
        end

        it 'returns string including unspecified' do
          expect(response).to eq('http://id.who.int/icd/release/11/2022-02/mms/1439886552/unspecified')
        end

        let(:stem_id_response) do
          stem_id = response.split('/')[-2]
          VCR.use_cassette('by_stemId_1439886552') { client.fetch_info_by_stem_id(stem_id) }
        end

        it 'returns information on the parent' do
          expect(stem_id_response['@id']).to eq('http://id.who.int/icd/release/11/2022-02/mms/1439886552')
          expect(stem_id_response['title']['@value']).to eq('Malaria')
        end
      end
    end
  end
end
