Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/manager', as: 'rails_admin'
  get 'eggs/get_by_address'
  get 'eggs/get_contract_information'
  get 'eggs/get_prices'
  get 'beast/get_information/:id', to: 'beast#get_information'
  get 'beast/get_price/:id', to: 'beast#get_price'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
