# frozen_string_literal: true

Rails.application.routes.draw do
  resources :notes, only: [:index, :create]
  root 'notes#index'
end
