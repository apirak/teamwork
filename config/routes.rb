Rails.application.routes.draw do
  root "static_pages#landing_page"
  get "dashboard", to: "static_pages#dashboard"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
