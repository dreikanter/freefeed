# frozen_string_literal: true

require "freefeed/request"

module Freefeed
  module V2
    module Users
      def whoami
        authenticated_request(:get, "/v2/users/whoami")
      end
    end
  end
end
