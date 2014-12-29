Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api, defaults: {format: :json} do
    resource :session, only: [:create, :destroy]
    resources :users do
      member do
        get :activate
      end
    end
  end

  get   '/auth/:provider/callback'       => 'api/sessions#oauth', as: :oauth
  get   '/api/check_if_unique_username'  => 'api/users#check_if_unique'

  constraints format: 'html' do
    get '*path', controller: 'home', action: 'index'
  end

end
