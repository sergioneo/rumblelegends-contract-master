Rails.application.routes.draw do
  get 'eggs/get_by_address'
  get 'eggs/get_contract_information'
  get 'eggs/get_prices'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
