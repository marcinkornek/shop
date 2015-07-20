Rails.application.routes.draw do
  mount JasmineRails::Engine => '/jasmine' if defined?(JasmineRails)

  root to: 'home#index'

  namespace :api, defaults: {format: :json} do
    resource :session, only: [:create, :destroy]
    resources :addresses
    resources :orders
    resources :product_colors
    resources :product_sizes
    resources :users do
      member do
        get :activate
      end
    end
  end

  get '/auth/:provider/callback'       => 'api/sessions#oauth', as: :oauth
  get '/api/check_if_unique_username'  => 'api/users#check_if_unique'
  put '/api/change_password'           => 'api/users#change_password'
  put '/api/reset_password'            => 'api/users#reset_password'
  put '/api/new_password'              => 'api/users#set_new_password'
  get '/api/categories'                => 'api/categories#index'
  get '/api/products_search'           => 'api/product_colors#products_search'

  constraints format: 'html' do
    get '*path', controller: 'home', action: 'index'
  end
end
