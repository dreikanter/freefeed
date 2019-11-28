# frozen_string_literal: true

require "http"
require "freefeed/error"

module Freefeed
  class Request
    BASE_URL = "https://freefeed.net"

    attr_accessor(
      :client,
      :options,
      :path,
      :rate_limit,
      :request_method,
      :uri,
      :options_key
    )

    def initialize(request_method, path, options = {})
      @request_method = request_method
      @uri = URI.parse(BASE_URL + path)
      @path = uri.path
      @options = options
    end

    def call
      response = http_client
        .headers(headers)
        .public_send(request_method, uri.to_s, options)

      # TODO: Populate error object with details
      error = Freefeed::Error::ERRORS[response.code]
      raise(error) if error

      response
    end

    private

    def headers
      {
        accept: "*/*",
        authorization: "Bearer #{Freefeed::Client.config.token}",
        user_agent: user_agent
      }
    end

    def user_agent
      "#{Freefeed::Client.name}/#{Freefeed::VERSION}"
    end

    # TODO: Timeout settinf
    # TODO: Proxy setting
    def http_client
      HTTP.use(logging: { logger: Freefeed::Client.config.logger })
    end
  end
end
