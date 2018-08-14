Rails.application.routes.draw do
  get 'beast/get_information/:id', to: 'beast#get_information'
  get 'beast/get_price/:id', to: 'beast#get_price'

  mount RailsAdmin::Engine => '/manager', as: 'rails_admin'
  get 'eggs/get_by_address'
  get 'eggs/get_contract_information'
  get 'eggs/get_prices'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
