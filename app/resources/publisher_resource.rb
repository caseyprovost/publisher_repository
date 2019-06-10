# frozen_string_literal: true

class PublisherResource < ApplicationResource
  attribute :name, :string
  attribute :description, :string
  attribute :uuid, :uuid
end
