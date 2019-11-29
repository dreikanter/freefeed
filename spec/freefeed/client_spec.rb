# frozen_string_literal: true

require "spec_helper"

describe Freefeed::Client do
  describe "#new" do
    subject(:instance) { described_class.new(params) }

    let(:token) { "[Token]" }
    let(:logger) { "[Logger]" }
    let(:base_url) { "[Base URL]" }

    context "when using explicit configuration" do
      let(:params) do
        {
          logger: logger,
          token: token,
          base_url: base_url
        }
      end

      it { expect(instance.token).to eq(token) }
      it { expect(instance.logger).to eq(logger) }
      it { expect(instance.base_url).to eq(base_url) }
    end

    context "when using defaults" do
      let(:params) { { token: token } }

      it { expect(instance.token).to eq(token) }
      it { expect(instance.logger).to be_a(Logger) }
      it { expect(instance.base_url).to eq("https://freefeed.net") }
    end
  end
end
