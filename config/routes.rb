Rails.application.routes.draw do
  resources :shorteners
  root 'shorteners#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
