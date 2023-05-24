Rails.application.routes.draw do
  root "lists#index"
  resources :lists do
    resources :items
  end
  post "items/:id/toggle", to: "items#toggle"
end
