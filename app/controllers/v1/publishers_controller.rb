# frozen_string_literal: true

module V1
  class PublishersController < ApplicationController
    before_action :reset_id_param

    def index
      publishers = PublisherResource.all(params)
      respond_with(publishers)
    end

    def show
      publisher = PublisherResource.find(params)
      respond_with(publisher)
    end

    def create
      publisher = PublisherResource.build(params)

      if publisher.save
        render jsonapi: publisher, status: 201
      else
        render jsonapi_errors: publisher
      end
    end

    def update
      publisher = PublisherResource.find(params)

      if publisher.update_attributes
        render jsonapi: publisher
      else
        render jsonapi_errors: publisher
      end
    end

    def destroy
      publisher = PublisherResource.find(params)

      if publisher.destroy
        render jsonapi: { meta: {} }, status: 200
      else
        render jsonapi_errors: publisher
      end
    end

    private

      def reset_id_param
        return if params[:id].blank?

        new_id = Publisher.find_by(uuid: params[:id]).try(:id)

        if new_id.present?
          params[:id] = new_id
        end
      end
  end
end
