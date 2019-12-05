# frozen_string_literal: true

RSpec.shared_context "client" do
  subject(:client) { Freefeed::Client.new(params) }

  let(:params) do
    {
      token: token,
      base_url: base_url,
      http_features: http_features
    }
  end

  let(:token) { ENV["FREEFEED_TOKEN"] || "[Token]" }
  let(:base_url) { "https://george.freefeed.net" }
  let(:http_features) { {} }

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
