# frozen_string_literal: true

require "spec_helper"

describe Freefeed::V2::Notifications do
  include_context "client"

  describe "#notifications" do
    subject(:response) { client.notifications }

    before do
      stub_request(:get, "#{base_url}/v2/notifications")
        .with(auth_headers)
        .to_return(
          body: file_fixture("v2/notifications/notifications.json"),
          headers: { "Content-Type" => "application/json" }
        )
    end

    it_should_behave_like("json hash response")
  end
end
