# frozen_string_literal: true

require "yaml"

module Kokki
  class Dictionary
    def lookup_by_alpha_2_code(code)
      lookup("alpha_2_code", code)
    end

    def lookup_by_alpha_3_code(code)
      lookup("alpha_3_code", code)
    end

    def lookup_by_name(name)
      lookup("name", name)
    end

    private

    def data
      @data ||= YAML.safe_load(File.read(File.expand_path("./data/dict.yml", __dir__)))
    end

    def lookup(key, value)
      entry = data.find { |e| e.dig(key).to_s == value }
      entry&.dig("emoji")
    end
  end
end
