# frozen_string_literal: true

require "logger"
require "dry-configurable"
require "freefeed/v2/users"
require "freefeed/version"

module Freefeed
  class Client
    extend Dry::Configurable

    include Freefeed::V2::Users

    setting(:token)
    setting(:logger, Logger.new(STDOUT))
  end
end
