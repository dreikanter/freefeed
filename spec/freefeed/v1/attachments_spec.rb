# frozen_string_literal: true

require "spec_helper"

describe Freefeed::V1::Attachments do
  include_context "client"

  describe "#create_attachment" do
    subject(:response) { client.create_attachment(source) }

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

    context "with an IO object" do
      let(:source) { file_fixture("100x100.png") }
      it_should_behave_like("json hash response")
    end

    context "with a path" do
      let(:source) { file_fixture("100x100.png").path }
      it_should_behave_like("json hash response")
    end
  end
end
