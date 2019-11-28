# frozen_string_literal: true

require "spec_helper"

describe Freefeed::Request do
  subject(:request) { described_class.new(request_method, path, options) }

  let(:request_method) { :get }
  let(:path) { "/v2/users/whoami" }
  let(:options) { {} }

  before do
    stub_request(:get, "https://freefeed.net/v2/users/whoami")
      .to_return(body: {}.to_json)
  end

  it { request.call }
end
