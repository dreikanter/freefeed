# frozen_string_literal: true

require "freefeed/request"
require "freefeed/authenticated_request"

module Freefeed
  module Utils
    def authenticated_request(request_method, path, params = {})
      AuthenticatedRequest.new(self, request_method, path, params).call
    end

    def request(request_method, path, params = {})
      Request.new(self, request_method, path, params).call
    end
  end
end
