# frozen_string_literal: true

require "spec_helper"

describe Freefeed::V2::Users do
  include_context "client"

  describe "#whoami" do
    subject(:response) { client.whoami }

    context "when token is valid" do
      before do
        stub_request(:get, "#{base_url}/v2/users/whoami")
          .with(
            headers: {
              "Accept" => "*/*",
              "Authorization" => "Bearer #{token}"
            }
          )
          .to_return(
            body: file_fixture("v2/users/whoami.json"),
            headers: {
              "Content-Type" => "application/json"
            }
          )
      end

      it { expect(response.status).to eq(200) }
      it { expect(response.parse).to be_a(Hash) }
    end

    context "when token is not valid" do
      let(:error_response) { { "err" => "..." } }

      before do
        stub_request(:get, "#{base_url}/v2/users/whoami")
          .to_return(status: 401, body: error_response.to_json)
      end

      it { expect { response }.to raise_error(Freefeed::Error::Unauthorized) }
    end
  end
end
