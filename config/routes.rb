Whogoesfirst::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  
  resources :rules, :only => [:index, :create]
  
  match 'random' => 'rules#random'

  match 'contact' => 'contact#create', :via => :post

  root :to => "rules#random"
end
