# frozen_string_literal: true

Rails.application.routes.draw do
  api_version(module: "V1", path: {value: "v1"}) do
    resources :publishers
  end
end
