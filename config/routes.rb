Rails.application.routes.draw do
  devise_for :users
  resources :results
  resources :exams, param: :token do
    get "generate", on: :member
  end
  get "thanks", to: "exams#thanks"
  get "custom", to: "exams#custom"
  resources :users
  resources :questions
  resources :answers
  resources :categories
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end