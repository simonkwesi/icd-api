# frozen_string_literal: true

require 'spec_helper'
require 'byebug'
RSpec.describe Icd::Api::Client do
  let(:client) { described_class.new(client_id: '',
                                     client_secret: '') }

  context 'Fetch by Code -- Good Value' do
    let(:response) do
      VCR.use_cassette('by_code_FB32.5') { client.fetch_stemId_by_code('FB32.5') }
    end
    it 'returns required fields' do
      expect(response).to eq('http://id.who.int/icd/release/11/2022-02/mms/254923627')
    end
  end

  context 'Fetch by Code -- Deprecated ' do
    let(:response) do
      VCR.use_cassette('by_code_1F4Z') { client.fetch_stemId_by_code('1F4Z') }
    end

    it 'returns string including unspecified' do
      byebug
      expect(response).to eq('http://id.who.int/icd/release/11/2022-02/mms/1439886552/unspecified')
    end

    let(:stem_id_response) do
      response.split('/')[-2]
      VCR.use_cassette('by_stemId_1439886552') { client.fetch_info_by_stemId('1F4Z') }
    end

    it 'returns information on the parent' do
      expect(stem_id_response).to eq('Cool')
    end
  end
end
