Rails.application.routes.draw do
  resources :successes do
    member do
      post :default
    end
  end
  resources :failures do
    member do
      post :default
    end
  end

  resources :specific_formats
  resources :specific_behaviours

  namespace :options do
    resources :successes
    resources :success_locations
    resources :success_templates
    resources :failure_locations
    resources :failure_templates
    resources :blocks
    resources :formats
  end

  namespace :turbo do
    resources :successes
    resources :failures
  end
end
