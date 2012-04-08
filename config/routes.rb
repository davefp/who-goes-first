Whogoesfirst::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  
  resources :rules

  root :to => "rules#random"
end
