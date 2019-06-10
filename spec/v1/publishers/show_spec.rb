# frozen_string_literal: true

require "rails_helper"

RSpec.describe "publishers#show", type: :request do
  let(:params) { {} }

  let(:make_request) do
    jsonapi_get "/v1/publishers/#{publisher.to_param}", params: params
  end

  describe "basic fetch" do
    let!(:publisher) { create(:publisher) }

    it "works" do
      publisher.save!
      expect(PublisherResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.first.jsonapi_type).to eq("publishers")
      expect(d.first.attributes["id"]).to eq(publisher.uuid)
    end
  end
end
