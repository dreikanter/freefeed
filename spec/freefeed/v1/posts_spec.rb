# frozen_string_literal: true

require "spec_helper"

describe Freefeed::V1::Posts do
  include_context "client"

  let(:own_post_id) { "467e9056-69fe-4bcf-b9ff-3ceb319b093e" }

  let(:post_id) { "88f932df-c865-43fb-8127-d31822a54d95" }

  describe "#like" do
    subject(:response) { client.like(post_id) }

    before do
      stub_request(:post, "#{base_url}/v1/posts/#{post_id}/like")
        .with(auth_headers)
        .to_return(empty_json_response)
    end

    it { expect(response.status).to eq(200) }
  end

  describe "#unlike" do
    subject(:response) { client.unlike(post_id) }

    before do
      stub_request(:post, "#{base_url}/v1/posts/#{post_id}/unlike")
        .with(auth_headers)
        .to_return(empty_json_response)
    end

    it { expect(response.status).to eq(200) }
  end

  describe "#hide" do
    subject(:response) { client.hide(post_id) }

    before do
      stub_request(:post, "#{base_url}/v1/posts/#{post_id}/hide")
        .with(auth_headers)
        .to_return(empty_json_response)
    end

    it { expect(response.status).to eq(200) }
  end

  describe "#unhide" do
    subject(:response) { client.unhide(post_id) }

    before do
      stub_request(:post, "#{base_url}/v1/posts/#{post_id}/unhide")
        .with(auth_headers)
        .to_return(empty_json_response)
    end

    it { expect(response.status).to eq(200) }
  end

  describe "#save" do
    subject(:response) { client.save(post_id) }

    before do
      stub_request(:post, "#{base_url}/v1/posts/#{post_id}/save")
        .with(auth_headers)
        .to_return(empty_json_response)
    end

    it { expect(response.status).to eq(200) }
  end

  describe "#unsave" do
    subject(:response) { client.unsave(post_id) }

    before do
      stub_request(:delete, "#{base_url}/v1/posts/#{post_id}/save")
        .with(auth_headers)
        .to_return(empty_json_response)
    end

    it { expect(response.status).to eq(200) }
  end
end
