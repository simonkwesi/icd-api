# frozen_string_literal: true

module Icd
  module Api
    class Options
      extend Dry::Configurable

      setting :release_id, default: '2022-02', reader: true
      setting :revision, default: '11', reader: true
      setting :linearization_name, default: 'mms', reader: true
      setting :root_url, default: 'https://id.who.int', reader: true

      %i[release_id revision linearization_name root_url].each do |new_method|
        define_method new_method do
          self.class.send new_method
        end
      end
    end
  end
end
