Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: :registrations,
                                   sessions: :sessions}

  resources :restaurants, only: [:new, :create, :edit, :update]
  root controller: :landing, action: :index
  resources :dashboard, only: [:show]
  resource :cart, only: [:show]
  resources :menus, only: [:new, :create] do
    resources :dishes, only: [:new, :create, :show] do
      post 'add_to_order', controller: :orders, action: :add_to_order
    end
  end

  namespace :api do
    namespace :v0 do
      resources :ping, only: [:index], constraints: {format: /(json)/}
    end
  end
end
