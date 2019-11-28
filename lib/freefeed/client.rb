# frozen_string_literal: true

require "logger"
require "dry-configurable"
require "freefeed/version"

module Freefeed
  class Client
    extend Dry::Configurable

    setting(:token)
    setting(:logger, Logger.new(STDOUT))
  end
end
