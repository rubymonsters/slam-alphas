Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]

  resources :users, controller: "users" do

    get '/edit_travel' => "users#edit_travel"

    member do
      get :change_password
      patch :update_password
    end

    resource :password,
             controller: "clearance/passwords",
             only: [:create, :edit, :update]

    resource :avatar

    resources :events,
              controller: "events",
              except: [:show]

  end

  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"

  get "/pages/:id" => "pages#show", as: :page
  get '/karte/:country', to: 'maps#show', as: :map
  get 'karte', to: redirect("/karte/de")

  root to: redirect("/karte/de")
end
