# frozen_string_literal: true

require "spec_helper"

describe Freefeed::V2::Timelines do
  include_context "client"

  describe "#best_of" do
    subject(:response) { client.best_of }

    before do
      stub_request(:get, "#{base_url}/v2/bestof")
        .with(
          headers: {
            "Accept" => "*/*",
            "Authorization" => "Bearer #{token}"
          }
        )
        .to_return(
          body: file_fixture("best_of.json"),
          headers: {
            "Content-Type" => "application/json"
          }
        )
    end

    it { expect(response.status).to eq(200) }
    it { expect(response.parse).to be_a(Hash) }
  end

  describe "#everything" do
    subject(:response) { client.everything }

    before do
      stub_request(:get, "https://george.freefeed.net/v2/everything")
        .with(
          headers: {
            "Accept" => "*/*"
          }
        )
        .to_return(
          body: file_fixture("everything.json"),
          headers: {
            "Content-Type" => "application/json"
          }
        )
    end

    it { expect(response.status).to eq(200) }
    it { expect(response.parse).to be_a(Hash) }
  end
end
