Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api, defaults: {format: :json} do
    resources :users do
      member do
        get :activate
      end
    end
  end

end
