# frozen_string_literal: true

require "freefeed/utils"

module Freefeed
  module V1
    module Attachments
      def create_attachment(source)
        options = { form: { file: file(source) } }
        authenticated_request(:post, "/v1/attachments", options)
      end

      private

      def file(source)
        HTTP::FormData::File.new(source, content_type: "image/png")
      end
    end
  end
end
