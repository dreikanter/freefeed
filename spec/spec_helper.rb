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
require "support/helpers"

RSpec.configure do |config|
  config.include Helpers
  config.color = true
  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

RSpec.shared_context "client" do
  subject(:client) { Freefeed::Client.new(params) }

  let(:params) do
    {
      logger: logger,
      token: token,
      base_url: base_url
    }
  end

  let(:token) { ENV["FREEFEED_TOKEN"] || "[Token]" }
  let(:logger) { Logger.new(STDOUT) }
  let(:base_url) { "https://george.freefeed.net" }

  def json_response(body)
    {
      headers: { "Content-Type" => "application/json" },
      body: body
    }
  end

  let(:empty_json_response) do
    json_response({}.to_json)
  end

  let(:auth_headers) do
    {
      headers: { "Authorization" => "Bearer #{token}" }
    }
  end
end
