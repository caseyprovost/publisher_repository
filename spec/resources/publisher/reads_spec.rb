# frozen_string_literal: true

require "rails_helper"

RSpec.describe PublisherResource, type: :resource do
  describe "serialization" do
    let!(:publisher) { create(:publisher) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.rawid).to eq(publisher.uuid)
      expect(data.jsonapi_type).to eq("publishers")
    end
  end

  describe "filtering" do
    let!(:publisher1) { create(:publisher) }
    let!(:publisher2) { create(:publisher) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: publisher2.uuid } }
      end

      it "works" do
        render
        expect(d.map(&:rawid)).to eq([publisher2.uuid])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:publisher1) { create(:publisher) }
      let!(:publisher2) { create(:publisher) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:rawid)).to eq([
            publisher1.uuid,
            publisher2.uuid
          ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:rawid)).to eq([
            publisher2.uuid,
            publisher1.uuid
          ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
