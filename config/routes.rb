Rails.application.routes.draw do
  resources :results
  resources :exams do
    get 'generate', on: :member
  end
  get 'thanks', to: 'exams#thanks'
  resources :candidates
  resources :questions
  resources :answers
  resources :categories
  devise_for :admins
  root to: "admin#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end