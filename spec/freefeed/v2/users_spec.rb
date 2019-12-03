# frozen_string_literal: true

require "spec_helper"

describe Freefeed::V2::Users do
  include_context "client"

  describe "#whoami" do
    subject(:response) { client.whoami }

    context "when token is valid" do
      before do
        stub_request(:get, "#{base_url}/v2/users/whoami")
          .with(
            headers: {
              "Accept" => "*/*",
              "Authorization" => "Bearer #{token}"
            }
          )
          .to_return(
            body: file_fixture("v2/users/whoami.json"),
            headers: { "Content-Type" => "application/json" }
          )
      end

      it_should_behave_like("json hash response")
    end

    context "when token is not valid" do
      let(:error_response) { { "err" => "..." } }

      before do
        stub_request(:get, "#{base_url}/v2/users/whoami")
          .to_return(status: 401, body: error_response.to_json)
      end

      it { expect { response }.to raise_error(Freefeed::Error::Unauthorized) }
    end
  end

  describe "#blocked_by_me" do
    subject(:response) { client.blocked_by_me }

    before do
      stub_request(:get, "#{base_url}/v2/users/blockedByMe")
        .with(auth_headers)
        .to_return(
          body: file_fixture("v2/users/blocked_by_me.json"),
          headers: { "Content-Type" => "application/json" }
        )
    end

    it_should_behave_like("json array response")
  end

  describe "#unread_directs_number" do
    subject(:response) { client.unread_directs_number }

    before do
      stub_request(:get, "#{base_url}/v2/users/getUnreadDirectsNumber")
        .with(auth_headers)
        .to_return(
          body: file_fixture("v2/users/unread_directs_number.json"),
          headers: { "Content-Type" => "application/json" }
        )
    end

    it_should_behave_like("json hash response")
  end

  describe "#unread_notifications_number" do
    subject(:response) { client.unread_notifications_number }

    before do
      stub_request(:get, "#{base_url}/v2/users/getUnreadNotificationsNumber")
        .with(auth_headers)
        .to_return(
          body: file_fixture("v2/users/unread_notifications_number.json"),
          headers: { "Content-Type" => "application/json" }
        )
    end

    it_should_behave_like("json hash response")
  end

  describe "#mark_all_directs_as_read" do
    subject(:response) { client.mark_all_directs_as_read }

    before do
      stub_request(:get, "#{base_url}/v2/users/markAllDirectsAsRead")
        .with(auth_headers)
        .to_return(
          body: file_fixture("v2/users/mark_all_directs_as_read.json"),
          headers: { "Content-Type" => "application/json" }
        )
    end

    it_should_behave_like("json hash response")
  end

  describe "#mark_all_notifications_as_read" do
    subject(:response) { client.mark_all_notifications_as_read }

    before do
      stub_request(:post, "#{base_url}/v2/users/markAllNotificationsAsRead")
        .with(auth_headers)
        .to_return(
          body: file_fixture("v2/users/mark_all_notifications_as_read.json"),
          headers: { "Content-Type" => "application/json" }
        )
    end

    it_should_behave_like("json hash response")
  end

end
