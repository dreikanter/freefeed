# frozen_string_literal: true

require "freefeed/request"

module Freefeed
  module V2
    module Users
      def whoami
        Freefeed::Request.new(:get, "/v2/users/whoami").call.parse
      end
    end
  end
end
