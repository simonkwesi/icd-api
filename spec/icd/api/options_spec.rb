# frozen_string_literal: true

require 'icd/api/authorizer'

RSpec.describe Icd::Api::Options do
  subject { described_class.new }

  describe '#release_id' do
    it 'defaults to 2023-01' do
      expect(subject.release_id).to eq('2023-01')
    end

    it 'default can be overwritten' do
      subject = described_class.new(release_id: '2022-05')
      expect(subject.release_id).to eq('2022-05')
    end
  end

  describe '#revision' do
    it 'defaults to 11' do
      expect(subject.revision).to eq('11')
    end

    it 'cannot be overwritten' do
      subject = described_class.new(revision: '12')
      expect(subject.revision).to eq('11')
    end
  end

  describe '#linearization_name' do
    it 'defaults to mms' do
      expect(subject.linearization_name).to eq('mms')
    end

    it 'default can be overwritten' do
      subject = described_class.new(linearization_name: 'mds')
      expect(subject.linearization_name).to eq('mds')
    end
  end

  describe '#root_url' do
    it 'defaults to WHO API endpoint' do
      expect(subject.root_url).to eq('https://id.who.int')
    end

    it 'default can be overwritten' do
      subject = described_class.new(root_url: 'https://dev.local')
      expect(subject.root_url).to eq('https://dev.local')
    end
  end
end
