# frozen_string_literal: true

require "dry-initializer"
require "freefeed/constants"
require "freefeed/v1/attachments"
require "freefeed/v1/comments"
require "freefeed/v1/posts"
require "freefeed/v2/notifications"
require "freefeed/v2/posts"
require "freefeed/v2/timelines"
require "freefeed/v2/users"
require "freefeed/version"

module Freefeed
  class Client
    extend Dry::Initializer

    include Freefeed::V1::Attachments
    include Freefeed::V1::Comments
    include Freefeed::V1::Posts
    include Freefeed::V2::Notifications
    include Freefeed::V2::Posts
    include Freefeed::V2::Timelines
    include Freefeed::V2::Users

    option :token
    option :base_url, default: -> { Freefeed::BASE_URL }
    option :http_features, default: -> { {} }
  end
end
