# frozen_string_literal: true

require "spec_helper"

describe Freefeed::V1::Attachments do
  include_context "client"

  describe "request" do
    subject(:response) { client.create_attachment(file) }

    let(:file) { file_fixture("100x100.png") }

    before do
      stub_request(:post, "https://george.freefeed.net/v1/attachments")
        .with(
          headers: {
            "Accept" => "*/*",
            "Authorization" => "Bearer #{token}",
            "Content-Type" => %r{^multipart/form-data}
          }
        )
        .to_return(
          body: file_fixture("v1/attachments/create_attachment.json").read,
          headers: { "Content-Type" => "application/json" }
        )
    end

    it { expect(response.status).to eq(200) }
    it { expect(response.parse).to be_a(Hash) }
  end
end
