# frozen_string_literal: true

require "spec_helper"

describe "#new" do
  include_context "client"

  context "when using explicit configuration" do
    it { expect(client.token).to eq(token) }
    it { expect(client.logger).to eq(logger) }
    it { expect(client.base_url).to eq(base_url) }
  end

  context "when using defaults" do
    let(:params) { { token: token } }

    it { expect(client.token).to eq(token) }
    it { expect(client.logger).to be_a(Logger) }
    it { expect(client.base_url).to eq("https://freefeed.net") }
  end

  context "when lacking required options" do
    let(:params) { {} }

    it { expect { client }.to raise_error(KeyError) }
  end
end
