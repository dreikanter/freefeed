# frozen_string_literal: true

require "spec_helper"

describe Freefeed::Client do
  subject(:response) { described_class.new.whoami }

  let(:token) { "Banana" }

  describe "#whoami" do
    context "when token is valid" do
      let(:response_body) { file_fixture("whoami.json") }

      before do
        described_class.configure do |config|
          config.token = token
        end

        stub_request(:get, "https://freefeed.net/v2/users/whoami")
          .with(
            headers: {
              "Accept" => "*/*",
              "Authorization" => "Bearer #{token}",
              "Host" => "freefeed.net"
            }
          )
          .to_return(
            body: response_body,
            headers: {
              "Content-Type" => "application/json"
            }
          )
      end

      it { expect(response).to be_a(Hash) }
    end

    context "when token is not valid" do
      let(:error_response) { { "err" => "..." } }

      before do
        stub_request(:get, "https://freefeed.net/v2/users/whoami")
          .to_return(status: 401, body: error_response.to_json)
      end

      it { expect { response }.to raise_error(Freefeed::Error::Unauthorized) }
    end
  end
end
