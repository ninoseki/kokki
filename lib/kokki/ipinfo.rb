# frozen_string_literal: true

require "json"
require "net/https"
require "uri"

module Kokki
  class IPInfo
    HOST = "ipinfo.io"
    BASE_URL = "https://#{HOST}"

    def geo(address)
      get("/#{address}/geo") { |json| json }
    end

    def self.geo(address)
      new.geo address
    end

    private

    def url_for(path)
      URI(BASE_URL + path)
    end

    def https_options
      if proxy = ENV["HTTPS_PROXY"] || ENV["https_proxy"]
        uri = URI(proxy)
        {
          proxy_address: uri.hostname,
          proxy_port: uri.port,
          proxy_from_env: false,
          use_ssl: true
        }
      else
        { use_ssl: true }
      end
    end

    def request(req)
      Net::HTTP.start(HOST, 443, https_options) do |http|
        response = http.request(req)

        case response.code
        when "200"
          yield JSON.parse(response.body)
        else
          raise(Error, "Unsupported response code returned: #{response.code}")
        end
      end
    end

    def get(path, &block)
      uri = url_for(path)
      get = Net::HTTP::Get.new(uri)

      request(get, &block)
    end
  end
end
