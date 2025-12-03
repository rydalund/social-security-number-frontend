Rails.application.routes.draw do
  resources :validations, only: [ :new, :create ]
  root "validations#new"
end
