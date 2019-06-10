# frozen_string_literal: true

require "rails_helper"

RSpec.describe "publishers#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/v1/publishers/#{publisher.id}", payload
  end

  describe "basic update" do
    let!(:publisher) { create(:publisher) }

    let(:payload) do
      {
        data: {
          id: publisher.id.to_s,
          type: "publishers",
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(PublisherResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { publisher.reload.attributes }
    end
  end
end
