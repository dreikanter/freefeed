# frozen_string_literal: true

require "freefeed/request"

module Freefeed
  class AuthenticatedRequest < Request
    private

    def headers
      super.merge(authorization: "Bearer #{client.token}")
    end
  end
end
