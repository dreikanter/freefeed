# frozen_string_literal: true

require "spec_helper"

describe Freefeed::V1::Posts do
  include_context "client"

  let(:own_feed_name) { "dreikanter" }
  let(:group_feed_name) { "letstalk" }
  let(:own_post_id) { "52c28be8-c63e-4db6-a451-e2b1a68a8608" }
  let(:post_id) { "88f932df-c865-43fb-8127-d31822a54d95" }
  let(:attachment_id) { "a66b9354-3755-4981-b9fe-42526582b5b0" }

  describe "#create_post" do
    subject(:response) { client.create_post(post) }

    let(:post) do
      {
        post: {
          "body" => "Sample post",
          "attachments" => [attachment_id]
        },
        meta: {
          "feeds" => [own_feed_name, group_feed_name],
          "commentsDisabled" => false
        }
      }
    end

    before do
      stub_request(:post, "#{base_url}/v1/posts")
        .with(auth_headers.merge(body: post.to_json))
        .to_return(json_response(file_fixture("v1/posts/create.json")))
    end

    it { expect(response.status).to eq(200) }
    it { expect(response.parse).to be_a(Hash) }
  end

  describe "#update_post" do
    subject(:response) { client.update_post(own_post_id, post) }

    let(:post) do
      {
        post: {
          "body" => "Updated post",
          "attachments" => []
        },
        meta: {
          "feeds" => [own_feed_name],
          "commentsDisabled" => true
        }
      }
    end

    before do
      stub_request(:put, "#{base_url}/v1/posts/#{own_post_id}")
        .with(auth_headers.merge(body: post.to_json))
        .to_return(json_response(file_fixture("v1/posts/update.json")))
    end

    it { expect(response.status).to eq(200) }
    it { expect(response.parse).to be_a(Hash) }
  end

  describe "#delete_post" do
    subject(:response) { client.delete_post(own_post_id) }

    before do
      stub_request(:delete, "#{base_url}/v1/posts/#{own_post_id}")
        .with(auth_headers)
        .to_return(body: file_fixture("v1/posts/delete.json"))
    end

    it { expect(response.status).to eq(200) }
  end

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

  describe "#disable_comments" do
    subject(:response) { client.disable_comments(own_post_id) }

    before do
      stub_request(:post, "#{base_url}/v1/posts/#{own_post_id}/disableComments")
        .with(auth_headers)
        .to_return(empty_json_response)
    end

    it { expect(response.status).to eq(200) }
  end

  describe "#enable_comments" do
    subject(:response) { client.enable_comments(own_post_id) }

    before do
      stub_request(:post, "#{base_url}/v1/posts/#{own_post_id}/enableComments")
        .with(auth_headers)
        .to_return(empty_json_response)
    end

    it { expect(response.status).to eq(200) }
  end
end
