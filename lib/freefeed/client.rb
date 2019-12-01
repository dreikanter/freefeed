# frozen_string_literal: true

require "logger"
require "dry-initializer"
require "freefeed/constants"
require "freefeed/v1/attachments"
require "freefeed/v2/users"
require "freefeed/v2/timelines"
require "freefeed/version"

module Freefeed
  class Client
    extend Dry::Initializer

    include Freefeed::V1::Attachments
    include Freefeed::V2::Users
    include Freefeed::V2::Timelines

    option :token
    option :logger, default: -> { Freefeed::LOGGER }
    option :base_url, default: -> { Freefeed::BASE_URL }
  end
end
