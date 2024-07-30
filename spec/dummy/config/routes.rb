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
    resources :blocks
    resources :formats

    namespace :location do
      resources :successes
      resources :failures
    end
    namespace :template do
      resources :successes
      resources :failures
    end
    namespace :status do
      resources :successes
      resources :failures
    end
  end

  namespace :turbo do
    resources :successes
    resources :failures
  end
end
