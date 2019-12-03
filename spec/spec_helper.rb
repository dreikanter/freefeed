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

Dir["./spec/support/**/*.rb"].sort.each { |path| require path }

RSpec.configure do |config|
  config.include Helpers
  config.color = true
  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
