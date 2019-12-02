# frozen_string_literal: true

module Freefeed
  module Utils
    def authenticated_request(request_method, path, params = {})
      perform_request(request_method, path, json: params, auth: true)
    end

    def request(request_method, path, params = {})
      perform_request(request_method, path, json: params, auth: false)
    end

    private

    def perform_request(request_method, path, options)
      Freefeed::Request.new(self, request_method, path, options).call
    end
  end
end
