Rails.application.routes.draw do

  root 'message#index'
  post "balancedMessage", to: "message#balancedMessage"
  get "balancedMessage", to: "message#balancedMessage"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
