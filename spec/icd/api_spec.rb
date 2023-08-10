# frozen_string_literal: true

require 'spec_helper'
module Icd
  RSpec.describe Api do
    it 'has a version number' do
      expect(Icd::Api::VERSION).not_to be nil
    end
  end
end
