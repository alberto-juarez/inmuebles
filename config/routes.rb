Rails.application.routes.draw do
  get 'favorites/update'
  devise_for :usertemps
  resources :messages

  resources :duenos
  resources :prospectos
  post 'toggle_fav', to: "properties#toggle_fav"
  get 'pdf/:id' => "properties#showpdf"
  get "addfav" => 'properties#addfav'
  get "misprospectos/:id" => 'prospectos#misprospectos', as: :misprospectos
  get "misduenos/:id" => 'duenos#misduenos', as: :misduenos
  get 'client/new'
  get 'client/create'
  devise_for :accounts
  # get '*unmatched_route', to: 'application#render_not_found'
  get 'dashboard' => 'dashboard#index'
  get 'dashboard/accounts'
  get "/profile/:id" => 'dashboard#profile', as: :profile
  patch "/featured" => "properties#update_multiple"
  get "/featured" => "properties#featured"
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    resources :properties
    get '/contacto' => 'static_pages#contacto'
    get '/nosotros' => 'static_pages#nosotros'
    get "/accounts" => "admin#accounts", as: :accounts
    get "/search" => "properties#search"
    post "/agent/message" => "properties#email_agent", as: :email_agent
    root to: 'public#main'
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
