require 'rails_helper'

RSpec.describe "publishers#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/v1/publishers/#{publisher.id}", params: params
  end

  describe 'basic fetch' do
    let!(:publisher) { create(:publisher) }

    it 'works' do
      expect(PublisherResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('publishers')
      expect(d.id).to eq(publisher.id)
    end
  end
end
