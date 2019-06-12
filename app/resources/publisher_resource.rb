# frozen_string_literal: true

class PublisherResource < ApplicationResource
  attribute :id, :uuid do
    @object.uuid
  end

  filter :id, only: [:eq] do
    eq { |scope, value| scope.find_by(uuid: value) }
  end

  attribute :name, :string
  attribute :description, :string
  attribute :uuid, :uuid
end
