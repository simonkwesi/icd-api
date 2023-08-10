# frozen_string_literal: true

require 'zeitwerk'
require 'dry-configurable'
require 'faraday'

module Icd
  module Api
    class Error < StandardError; end
  end
end
root = File.expand_path('..', __dir__)

loader = Zeitwerk::Loader.new
loader.push_dir(root)
loader.ignore("#{root}/icd-api.rb", "#{root}/icd/api/version.rb")
loader.setup
