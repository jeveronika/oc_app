Rails.application.routes.draw do
  get 'users/profile'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get "/u/:id", to: "users#profile", as: "user"

  get "/overview", to: "overview#index"

  

  resources :entries

  get "about", to: "pages#about"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"



  get '*path', to: 'pages#not_found', via: :all

end
