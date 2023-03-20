Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :payments
      resources :bookings
      resources :rooms
      resources :guests
    end
  end
end
