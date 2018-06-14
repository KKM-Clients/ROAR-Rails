Rails.application.routes.draw do

  get 'events/index'
  root "home#index"

  #get 'vendors/index'
  #get 'vendors/create'
  #get 'vendors/new'
  #get 'vendors/show'

  #get 'riders/index'
  #get 'riders/create'
  #get 'riders/new'
  #get 'riders/show'

  #get 'trail_ratings/index'
  #get 'trail_ratings/create'
  #get 'trail_ratings/new'
  #get 'trail_ratings/show'

  #get 'lodging/index'
  #get 'lodging/create'
  #get 'lodging/new'
  #get 'lodging/show'

  #get 'trails/index'
  #get 'trails/create'
  #get 'trails/new'
  #get 'trails/show'

  #get 'rules_regs/index'
  #get 'rules_regs/create'
  #get 'rules_regs/new'
  #get 'rules_regs/show'

  get 'home/index'

  resources :rules_regs
  resources :trail_ratings
  resources :trails
  resources :riders
  resources :vendors
  resources :lodging
  resources :square

  get 'contact/index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
