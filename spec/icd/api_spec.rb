# frozen_string_literal: true

RSpec.describe Icd::Api do
  it 'has a version number' do
    expect(Icd::Api::VERSION).not_to be_nil
  end
end
