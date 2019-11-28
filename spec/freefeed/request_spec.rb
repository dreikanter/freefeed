# frozen_string_literal: true

require "spec_helper"

describe Freefeed::Request do
  subject(:request) { described_class.new(request_method, path, options) }

  let(:request_method) { :get }
  let(:path) { "/example" }
  let(:options) { {} }

  let(:expected_url) { "https://freefeed.net/example" }

  context "when respose is successfull" do
    before { stub_request(:get, expected_url).to_return(body: {}.to_json) }
    it { request.call }
  end

  context "when bad request" do
    before { stub_request(:get, expected_url).to_return(status: 400) }
    it { expect { request.call }.to raise_error(Freefeed::Error::BadRequest) }
  end

  context "when unathorized" do
    before { stub_request(:get, expected_url).to_return(status: 401) }
    it { expect { request.call }.to raise_error(Freefeed::Error::Unauthorized) }
  end

  context "when forbidden" do
    before { stub_request(:get, expected_url).to_return(status: 403) }
    it { expect { request.call }.to raise_error(Freefeed::Error::Forbidden) }
  end

  context "when forbidden" do
    before { stub_request(:get, expected_url).to_return(status: 500) }
    it { expect { request.call }.to raise_error(Freefeed::Error::ServerError) }
  end
end
