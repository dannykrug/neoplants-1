Rails.application.routes.draw do

  root 'application#homepage'
  get '/', to: "application#homepage"
  get "/plants/seed", to: "plants#seed"
  get "/plants/death", to: "plants#death"
  resources :plants
  get "/signup", to: "users#new"
  post "/users", to: "users#create"
  get "/personality_quiz", to: "plants#personality"
  post "/personality_quiz", to: "plants#create_personality"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/plants", to: "plants#index"
  delete "/logout", to: "sessions#destroy"


  #post path for personality quiz
  # post ""

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
