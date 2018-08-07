Rails.application.routes.draw do

  #get 'gallery/index'
  get 'events/index'
  root "home#index"


  get 'home/index'

  resources :rules_regs
  resources :trail_ratings
  resources :trails
  resources :riders
  resources :vendors
  resources :lodging
  resources :square
  resources :gallery

  get 'contact/index'

  get "/pages/*page" => "pages#show" # all requests matching site/any_page will go PagesController, show method

  # other routes ...
  PagesController.action_methods.each do |action|
   get "/#{action}", to: "pages##{action}", as: "#{action}_page"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
