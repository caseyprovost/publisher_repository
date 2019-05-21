require 'rails_helper'

RSpec.describe PublisherResource, type: :resource do
  describe 'serialization' do
    let!(:publisher) { create(:publisher) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(publisher.id)
      expect(data.jsonapi_type).to eq('publishers')
    end
  end

  describe 'filtering' do
    let!(:publisher1) { create(:publisher) }
    let!(:publisher2) { create(:publisher) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: publisher2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([publisher2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:publisher1) { create(:publisher) }
      let!(:publisher2) { create(:publisher) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            publisher1.id,
            publisher2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            publisher2.id,
            publisher1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
