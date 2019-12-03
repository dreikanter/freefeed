# frozen_string_literal: true

require "http"
require "freefeed/constants"
require "freefeed/error"

module Freefeed
  class Request
    extend Dry::Initializer

    param :client
    param :request_method
    param :path
    param :options, optional: true, default: -> { {} }

    def call
      response = http_client
        .headers(headers)
        .public_send(request_method, uri, **request_params)

      error = Freefeed::Error.for(response)
      raise(error) if error
      response
    end

    private

    def uri
      @uri ||= URI.parse(client.base_url + path).to_s
    end

    def request_params
      options.slice(:json, :form, :params, :body)
    end

    def headers
      {
        accept: "*/*",
        user_agent: "#{Freefeed::Client.name}/#{Freefeed::VERSION}"
      }
    end

    def user_agent
      "#{Freefeed::Client.name}/#{Freefeed::VERSION}"
    end

    # TODO: Timeout settinf
    # TODO: Proxy setting
    def http_client
      HTTP.use(logging: { logger: client.logger })
    end
  end
end
