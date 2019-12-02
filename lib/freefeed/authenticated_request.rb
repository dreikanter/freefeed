# frozen_string_literal: true

require "http"
require "freefeed/constants"
require "freefeed/error"

module Freefeed
  class AuthenticatedRequest < Request
    private

    def headers
      super.merge(authorization: "Bearer #{client.token}")
    end
  end
end
