# frozen_string_literal: true

require "spec_helper"

describe Freefeed::Request do
  include_context "client"

  describe "request" do
    subject(:request) { described_class.new(client, request_method, path) }

    let(:request_method) { :get }
    let(:path) { "/example" }
    let(:expected_url) { "https://george.freefeed.net/example" }

    context "when respose is successfull" do
      before { stub_request(:get, expected_url).to_return(body: {}.to_json) }
      it { request.call }
    end

    shared_examples "raises" do |error|
      it { expect { request.call }.to raise_error(error) }
    end

    context "when bad request" do
      before { stub_request(:get, expected_url).to_return(status: 400) }
      include_examples("raises", Freefeed::Error)
    end

    context "when unathorized" do
      before { stub_request(:get, expected_url).to_return(status: 401) }
      include_examples("raises", Freefeed::Error::Unauthorized)
    end

    context "when forbidden" do
      before { stub_request(:get, expected_url).to_return(status: 403) }
      include_examples("raises", Freefeed::Error::Forbidden)
    end

    context "when forbidden" do
      before { stub_request(:get, expected_url).to_return(status: 500) }
      include_examples("raises", Freefeed::Error::ServerError)
    end
  end
end
