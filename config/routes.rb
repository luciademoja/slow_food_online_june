Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: :registrations,
                                   sessions: :sessions}

  resources :restaurants, only: [:new, :create, :edit, :update, :show]
  root controller: :landing, action: :index
  resources :dashboard, only: [:show]
  resources :menus, only: [:new, :create] do
    resources :dishes, only: [:new, :create, :show]
  end

end
