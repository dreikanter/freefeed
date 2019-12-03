# frozen_string_literal: true

require "freefeed/utils"
require "mimemagic"

module Freefeed
  module V1
    module Attachments
      # @param [String, Pathname, IO] source could by a file path
      # or an IO object
      def create_attachment(source)
        options = { form: { file: file(source) } }
        authenticated_request(:post, "/v1/attachments", options)
      end

      private

      def file(source)
        HTTP::FormData::File.new(source, content_type: content_type(source))
      end

      def content_type(source)
        return MimeMagic.by_magic(source) if source.is_a?(IO)
        MimeMagic.by_path(source.to_s)
      end
    end
  end
end
