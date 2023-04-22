Rails.application.routes.draw do
  resources :classifications
  resources :reservations do
    post :refresh, on: :collection
    post :available_rooms, on: :collection
  end
  resources :rooms
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "reservations#new"
end
