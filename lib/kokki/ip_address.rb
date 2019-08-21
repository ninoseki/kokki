# frozen_string_literal: true

require "ipaddr"

module Kokki
  class IPAddress
    attr_reader :address

    PRIVATE_IPS = %w(10.0.0.0/8 172.16.0.0/12 192.168.0.0/16).map { |ip| IPAddr.new(ip) }.freeze

    def initialize(address)
      @address = address

      raise InvalidInputError, "Invalid input: #{address}" if !valid_format? || internal?
    end

    def country_code
      @country_code ||=
        [].tap do |out|
          begin
            res = IPInfo.geo(address)
            out << res.dig("country")
          rescue Error => _e
            out << nil
          end
        end.first
    end

    def internal?
      loopback? || private?
    end

    def loopback?
      address == "0.0.0.0" || address.start_with?("127") || address == "::1"
    end

    def private?
      PRIVATE_IPS.any? { |ip| ip.include?(address) }
    end

    private

    def valid_format?
      IPAddr.new(address)
      true
    rescue IPAddr::InvalidAddressError => _e
      false
    end
  end
end
