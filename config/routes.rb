Rails.application.routes.draw do
  resources :users, only: [:create]
  get "/signup", to: "users#new"
  get "/personality_quiz", to: "plants#personality"
  post "/personality_quiz", to: "plants#create_personality"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/plant_homepage", to: "sessions#plant_homepage"
  delete "/logout", to: "sessions#destroy"
  get "/plants/seed", to: "plants#seed"
  #post path for personality quiz
  # post ""

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
