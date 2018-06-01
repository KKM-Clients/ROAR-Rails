Rails.application.routes.draw do
  get 'lodging/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'vendor_registration/index'
  get 'contact/index'
  get 'event/index'
  get 'trails/index'
  get 'trail_rating/index'
  get 'rules_regs/index'
  get 'riders_rules/index'
  get 'homepage/index'
  get 'rider_registration/index'

  root 'homepage#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
