# frozen_string_literal: true

require "spec_helper"

describe Freefeed::V2::Timelines do
  include_context "client"

  describe "#best_of" do
    subject(:response) { client.best_of }

    before do
      stub_request(:get, "#{base_url}/v2/bestof")
        .with(auth_headers)
        .to_return(
          body: file_fixture("v2/timelines/best_of.json"),
          headers: { "Content-Type" => "application/json" }
        )
    end

    it_should_behave_like("json hash response")
  end

  describe "#everything" do
    subject(:response) { client.everything }

    before do
      stub_request(:get, "#{base_url}/v2/everything")
        .to_return(
          body: file_fixture("v2/timelines/everything.json"),
          headers: { "Content-Type" => "application/json" }
        )
    end

    it_should_behave_like("json hash response")
  end

  describe "#own_timeline" do
    context "with no filter" do
      subject(:response) { client.own_timeline }

      before do
        stub_request(:get, "#{base_url}/v2/timelines/home")
          .with(auth_headers)
          .to_return(
            body: file_fixture("v2/timelines/timeline.json"),
            headers: {
              "Content-Type" => "application/json"
            }
          )
      end

      it_should_behave_like("json hash response")
    end

    context "with filter" do
      subject(:response) { client.own_timeline(filter: "likes") }

      before do
        stub_request(:get, "#{base_url}/v2/timelines/filter/likes")
          .with(auth_headers)
          .to_return(
            body: file_fixture("v2/timelines/timeline.json"),
            headers: {
              "Content-Type" => "application/json"
            }
          )
      end

      it_should_behave_like("json hash response")
    end
  end

  describe "#timeline" do
    subject(:response) { client.timeline("dreikanter") }

    before do
      stub_request(:get, "#{base_url}/v2/timelines/dreikanter")
        .with(auth_headers)
        .to_return(
          body: file_fixture("v2/timelines/timeline.json"),
          headers: { "Content-Type" => "application/json" }
        )
    end

    it_should_behave_like("json hash response")
  end

  describe "#comments_timeline" do
    subject(:response) { client.comments_timeline("dreikanter") }

    before do
      stub_request(:get, "#{base_url}/v2/timelines/dreikanter/comments")
        .with(auth_headers)
        .to_return(
          body: file_fixture("v2/timelines/timeline.json"),
          headers: { "Content-Type" => "application/json" }
        )
    end

    it_should_behave_like("json hash response")
  end

  describe "#likes_timeline" do
    subject(:response) { client.likes_timeline("dreikanter") }

    before do
      stub_request(:get, "#{base_url}/v2/timelines/dreikanter/likes")
        .with(auth_headers)
        .to_return(
          body: file_fixture("v2/timelines/timeline.json"),
          headers: { "Content-Type" => "application/json" }
        )
    end

    it_should_behave_like("json hash response")
  end
end
