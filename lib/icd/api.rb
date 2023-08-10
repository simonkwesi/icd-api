# frozen_string_literal: true

require 'zeitwerk'
require 'dry-configurable'
require 'faraday'
require 'icd/api/version'

LOADER = Zeitwerk::Loader.new
%w[lib].each do |require_path|
  LOADER.push_dir(require_path)
end

LOADER.setup

module Icd
  module Api
    class Error < StandardError; end
  end
end
