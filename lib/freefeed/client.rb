# frozen_string_literal: true

require "logger"
require "dry-initializer"
require "freefeed/v2/users"
require "freefeed/version"

module Freefeed
  class Client
    extend Dry::Initializer

    include Freefeed::V2::Users

    option :token, optional: false
    option :logger, optional: true, default: -> { Logger.new(STDOUT) }
    option :base_url, optional: true, default: -> { "https://freefeed.net" }
  end
end
