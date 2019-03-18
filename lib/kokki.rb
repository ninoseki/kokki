# frozen_string_literal: true

require "kokki/version"
require "kokki/errors"

require "kokki/dictionary"
require "kokki/ip_address"
require "kokki/converter"

module Kokki
  def self.flagize(input)
    Converter.convert input
  end
end
