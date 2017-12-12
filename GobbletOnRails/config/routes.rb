Rails.application.routes.draw do
  root "gobblet_on_rails#index"
  get "/gobblet_on_rails" => "gobblet_on_rails#index"
  get "/" => "gobblet_on_rails#index"
  get 'gobblet_on_rails/index'
  post "/" => "gobblet_on_rails#submitNames"

  resources :players
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
