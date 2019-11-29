# frozen_string_literal: true

require "freefeed/utils"

module Freefeed
  module V2
    module Timelines
      include Freefeed::Utils

      def best_of
        authenticated_request(:get, "/v2/bestof")
      end

      def everything
        request(:get, "/v2/everything", auth: false)
      end
    end
  end
end
