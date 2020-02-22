Rails.application.routes.draw do
  resources :tags
  resources :categories
  resources :ads

  root 'ads#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
