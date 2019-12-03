# frozen_string_literal: true

require "spec_helper"

describe Freefeed::V1::Attachments do
  include_context "client"

  describe "#create_attachment" do
    context "with implicit content type" do
      subject(:response) { client.create_attachment(source) }

      before do
        stub_request(:post, "#{base_url}/v1/attachments")
          .with(
            headers: {
              "Accept" => "*/*",
              "Authorization" => "Bearer #{token}",
              "Content-Type" => %r{^multipart/form-data}
            }
          )
          .to_return(
            body: file_fixture("v1/attachments/create.json").read,
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

  context "with explicit content type" do
    subject(:response) do
      client.create_attachment(source, content_type: content_type)
    end

    let(:source) { file_fixture("100x100.png") }
    let(:content_type) { "image/jpg" }

    before do
      stub_request(:post, "#{base_url}/v1/attachments")
        .with { |request| request.body.match?(/Content-Type: #{content_type}/) }
        .to_return(
          body: file_fixture("v1/attachments/create.json").read,
          headers: { "Content-Type" => "application/json" }
        )
    end

    it_should_behave_like("json hash response")
  end
end
