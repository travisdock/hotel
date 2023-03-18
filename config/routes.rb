Rails.application.routes.draw do
  resources :bookings do
    post :refresh, on: :collection
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "bookings#new"
end
