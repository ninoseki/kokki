# frozen_string_literal: true

require "ipaddr"
require "geocoder"

module Kokki
  class IPAddress
    attr_reader :address

    def initialize(address)
      raise InvalidInputError, "invalid input: #{address}" unless ip_address?(address)

      @address = address
    end

    def country_code
      @country_code ||=
        [].tap do |out|
          out << Geocoder.search(address)&.first&.country_code&.upcase
        rescue Geocoder::Error => _
          out << nil
        end.first
    end

    private

    def ip_address?(address)
      IPAddr.new(address)
      true
    rescue IPAddr::InvalidAddressError => _
      false
    end
  end
end
