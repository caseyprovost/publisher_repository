require 'rails_helper'

RSpec.describe "publishers#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/v1/publishers", params: params
  end

  describe 'basic fetch' do
    let!(:publisher1) { create(:publisher) }
    let!(:publisher2) { create(:publisher) }

    it 'works' do
      expect(PublisherResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['publishers'])
      expect(d.map(&:id)).to match_array([publisher1.id, publisher2.id])
    end
  end
end
