# frozen_string_literal: true

require "http"
require "freefeed/constants"
require "freefeed/error"

module Freefeed
  class Request
    extend Dry::Initializer

    param :request_method
    param :path
    option :base_url, optional: true, default: -> { Freefeed::BASE_URL }
    option :params, optional: true, default: -> { {} }
    option :logger, optional: true, default: -> { Freefeed::LOGGER }
    option :token, optional: true

    def call
      response = http_client
        .headers(headers)
        .public_send(request_method, uri, params)

      error = Freefeed::Error.for(response)
      raise(error) if error
      response
    end

    private

    def uri
      @uri ||= URI.parse(base_url + path).to_s
    end

    def headers
      {
        accept: "*/*",
        authorization: "Bearer #{token}",
        user_agent: user_agent
      }
    end

    def user_agent
      "#{Freefeed::Client.name}/#{Freefeed::VERSION}"
    end

    # TODO: Timeout settinf
    # TODO: Proxy setting
    def http_client
      HTTP.use(logging: { logger: logger })
    end
  end
end
