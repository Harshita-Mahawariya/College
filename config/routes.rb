Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root "courses#index"
  root "students#index"
  resources :courses
  resources :students do
    get 'search', to: 'students#search', on: :collection
  end
end
