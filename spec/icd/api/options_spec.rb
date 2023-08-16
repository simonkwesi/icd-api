# frozen_string_literal: true

require 'spec_helper'

module Icd
  module Api
    RSpec.describe Options do
      subject { described_class.new }

      describe '#release_id' do
        it 'defaults to 2022-02' do
          expect(subject.release_id).to eq('2022-02')
        end
        it 'default can be overwritten' do
          described_class.config.release_id = '2022-05'
          expect(subject.release_id).to eq('2022-05')
        end
      end

      describe '#revision' do
        it 'defaults to 11' do
          expect(subject.revision).to eq('11')
        end
      end

      describe '#linearization_name' do
        it 'defaults to mms' do
          expect(subject.linearization_name).to eq('mms')
        end
        it 'default can be overwritten' do
          described_class.config.linearization_name = 'mds'
          expect(subject.linearization_name).to eq('mds')
        end
      end

      describe '#root_url' do
        it 'defaults to WHO API endpoint' do
          expect(subject.root_url).to eq('https://id.who.int')
        end
        it 'default can be overwritten' do
          described_class.config.root_url = 'https://dev.local'
          expect(subject.root_url).to eq('https://dev.local')
        end
      end
    end
  end
end
