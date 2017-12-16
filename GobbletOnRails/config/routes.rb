Rails.application.routes.draw do
  resources :game_states
  root "gobblet_on_rails#index"
  get 'game_page/play' => "game_page#play"
  get "/gobblet_on_rails" => "gobblet_on_rails#index"
  get "/" => "gobblet_on_rails#index"
  get 'gobblet_on_rails/index'
  post "/" => "gobblet_on_rails#submitNames"
  post "/game_page/play" => "game_page#enterMove"

  resources :players
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
