# frozen_string_literal: true

require "ipaddr"

module Kokki
  class Converter
    attr_reader :input, :upcase, :dict

    def initialize(input)
      @input = input
      @upcase = input.upcase
      @dict = Dictionary.new
    end

    def convert
      flag = nil

      flag = dict.lookup_by_alpha_2_code(upcase) if input.length == 2
      flag = dict.lookup_by_alpha_3_code(upcase) if input.length == 3
      flag ||= dict.lookup_by_name(upcase)
      flag ||= convert_as_ip_address(input)

      raise InvalidInputError, "invalid input: #{input}" unless flag

      flag
    end

    def self.convert(input)
      new(input).convert
    end

    private

    def convert_as_ip_address(ip_address)
      ip = IPAddress.new(ip_address)
      dict.lookup_by_alpha_2_code ip.country_code
    end
  end
end
