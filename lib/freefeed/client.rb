# frozen_string_literal: true

require "dry-configurable"

module Freefeed
  class Client
    extend Dry::Configurable

    setting :token
  end
end
