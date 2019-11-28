# frozen_string_literal: true

require "simplecov"

SimpleCov.formatters = [SimpleCov::Formatter::HTMLFormatter]

SimpleCov.start do
  add_filter "/spec/"
end

require "freefeed"
require "rspec"
require "pry"
require "webmock/rspec"

RSpec.configure do |config|
  config.color = true

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
