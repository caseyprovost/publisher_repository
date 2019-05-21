# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Graphiti::Rails
  include Graphiti::Responders

  register_exception Graphiti::Errors::RecordNotFound, status: 404

  rescue_from StandardError do |e|
    handle_exception(e)
  end

  private

    def handle_exception(exception)
      raise exception
    end
end
