# frozen_string_literal: true

class PublisherResource < ApplicationResource
  attribute :id, :uuid do
    @object.uuid
  end
  attribute :name, :string
  attribute :description, :string
end
