# frozen_string_literal: true

RSpec.describe Freefeed::Client do
  describe "config" do
    subject(:config) { described_class.config }

    let(:token) { "Banana" }

    before do
      described_class.configure do |config|
        config.token = token
      end
    end

    it { expect(config.token).to eq(token) }
  end
end
