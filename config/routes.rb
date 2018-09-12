Rails.application.routes.draw do

  root 'application#homepage'
  post "/plants/:id/actions/:action_id", to: "plants#actions"
  get '/', to: "application#homepage"
  get '/plants/plant_homepage', to: "plants#index"
  get "/plants/seed", to: "plants#seed"
  get "/plants/death", to: "plants#death"
  get "/plants", to: "plants#index"
  resources :plants
  get "/signup", to: "users#new"
  post "/users", to: "users#create"
  get "/personality_quiz", to: "plants#personality"
  post "/personality_quiz", to: "plants#create_personality"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"



  #post path for personality quiz
  # post ""

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
