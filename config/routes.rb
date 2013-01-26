Whogoesfirst::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  
  resources :rules, :only => [:index, :create, :show]
  
  get 'random' => 'rules#random'

  post 'contact' => 'contact#create'

  root :to => "rules#random"
end
