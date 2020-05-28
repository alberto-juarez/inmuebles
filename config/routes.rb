Rails.application.routes.draw do
  devise_for :usertemps
  resources :messages

  resources :prospectos
  post 'toggle_fav', to: "properties#toggle_fav"
  get "misprospectos/:id" => 'prospectos#misprospectos', as: :misprospectos

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
    get "/search" => "properties#search"
    root to: 'public#main'
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
