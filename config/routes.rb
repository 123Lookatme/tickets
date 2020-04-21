# frozen_string_literal: true

# Routes
Rails.application.routes.draw do
  root to: 'tickets#index'

  resources :tickets, only: %i[index show]

  namespace :api, defauts: { format: :json } do
    namespace :v1 do
      resource :contract, only: :create
    end
  end
end
