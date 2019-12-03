# frozen_string_literal: true

RSpec.shared_examples "json hash response" do
  it { expect(response.status).to eq(200) }
  it { expect(response.parse).to be_a(Hash) }
end
