# frozen_string_literal: true

class ApplicationController < ActionController::API
  respond_to :jsonapi

  register_exception Graphiti::Errors::RecordNotFound, status: 404

  rescue_from StandardError do |e|
    handle_exception(e)
  end

  private

  def handle_exception(exception)
    raise exception
  end
end
