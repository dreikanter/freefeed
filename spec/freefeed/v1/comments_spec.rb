# frozen_string_literal: true

require "spec_helper"

describe Freefeed::V1::Comments do
  include_context "client"

  describe "#create_comment" do
    subject(:response) { client.create_comment(comment) }

    let(:comment) do
      {
        comment: {
          body: "Sample comment",
          postId: "52c28be8-c63e-4db6-a451-e2b1a68a8608"
        }
      }
    end

    before do
      stub_request(:post, "#{base_url}/v1/comments")
        .with(auth_headers.merge(body: comment.to_json))
        .to_return(json_response(file_fixture("v1/comments/create.json")))
    end

    it_should_behave_like("json hash response")
  end

  describe "#update_comment" do
    subject(:response) { client.update_comment(comment_id, comment) }

    let(:comment_id) { "5dd3c45c-454f-409a-af23-a09d73cc1622" }
    let(:comment) { { comment: { body: "Updated comment" } } }

    before do
      stub_request(:put, "#{base_url}/v1/comments/#{comment_id}")
        .with(auth_headers.merge(body: comment.to_json))
        .to_return(json_response(file_fixture("v1/comments/update.json")))
    end

    it_should_behave_like("json hash response")
  end

  describe "#delete_comment" do
    subject(:response) { client.delete_comment(comment_id) }

    let(:comment_id) { "6fcd6347-40b8-435f-a75a-c4eda4cc33dc" }

    before do
      stub_request(:delete, "#{base_url}/v1/comments/#{comment_id}")
        .with(auth_headers)
        .to_return(empty_json_response)
    end

    it_should_behave_like("json hash response")
  end
end
