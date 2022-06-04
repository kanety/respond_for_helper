Rails.application.routes.draw do
  resources :successes do
    member do
      post :default
    end
  end
  resources :success_locations
  resources :success_templates
  resources :failures do
    member do
      post :default
    end
  end
  resources :failure_locations
  resources :failure_templates

  resources :specific_formats
  resources :specific_behaviours

  namespace :turbo do
    resources :successes
    resources :failures
  end

  namespace :options do
    resources :successes
    resources :blocks
    resources :formats
  end
end
