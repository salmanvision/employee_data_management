Rails.application.routes.draw do
  root to: 'personal_data#index'
  resources :personal_data
  resources :employments, only: [:create] do
    member do
      post :add_employment
    end
  end
end
