# frozen_string_literal: true

require "rails_helper"

RSpec.describe "publishers#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/v1/publishers", payload
  end

  describe "basic create" do
    let(:params) do
      attributes_for(:publisher)
    end
    let(:payload) do
      {
        data: {
          type: "publishers",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(PublisherResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Publisher.count }.by(1)
    end
  end
end
