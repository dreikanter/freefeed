# frozen_string_literal: true

require "spec_helper"

describe Freefeed::Client do
  describe "config" do
    subject(:config) { described_class.config }

    let(:token) { "[Token]" }
    let(:logger) { "[Logger]" }

    before do
      described_class.configure do |config|
        config.token = token
        config.logger = logger
      end
    end

    it { expect(config.token).to eq(token) }
    it { expect(config.logger).to eq(logger) }
  end
end
