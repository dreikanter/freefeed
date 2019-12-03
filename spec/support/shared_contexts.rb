# frozen_string_literal: true

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
