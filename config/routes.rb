Rails.application.routes.draw do
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#top'
  get 'privacy', to: 'static_pages#privacy'
  resources :users, only: %i[new create edit update]
  resources :merchandises, only: %i[new create index edit update destroy]
  post '/update_amount' => 'merchandises#update_amount'
  resources :bookmarks, only: %i[create destroy update]
  resources :categories, only: %i[index destroy] do
    get 'category_users',on: :collection
  end
end
