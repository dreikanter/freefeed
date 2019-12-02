# frozen_string_literal: true

require "spec_helper"

describe Freefeed::V2::Posts do
  include_context "client"

  let(:post_id) { "467e9056-69fe-4bcf-b9ff-3ceb319b093e" }

  describe "#post" do
    subject(:response) { client.post(post_id) }

    before do
      stub_request(:get, "#{base_url}/v2/posts/#{post_id}")
        .with(headers: { "Authorization" => "Bearer #{token}" })
        .to_return(
          body: file_fixture("v1/posts/post.json"),
          headers: { "Content-Type" => "application/json" }
        )
    end

    it { expect(response.status).to eq(200) }
    it { expect(response.parse).to be_a(Hash) }
  end

  describe "#post_open_graph" do
    subject(:response) { client.post_open_graph(post_id) }

    before do
      stub_request(:get, "#{base_url}/v2/posts-opengraph/#{post_id}")
        .with(headers: { "Authorization" => "Bearer #{token}" })
        .to_return(
          body: file_fixture("v2/posts/post_open_graph.html"),
          headers: { "Content-Type" => "text/html" }
        )
    end

    it { expect(response.status).to eq(200) }
  end
end
