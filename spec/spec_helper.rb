# frozen_string_literal: true

require 'bundler/setup'
require 'icd/api'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/vcr'
  config.hook_into :webmock
  config.default_cassette_options = {
    match_requests_on: %i[method uri body headers], allow_unused_http_interactions: false, record: :once, erb: true
  }
  config.filter_sensitive_data('Secret') do |interaction|
    interaction.request.body.sub('client_id=', '')
    interaction.request.body.sub('client_secret=', '')
  end
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
