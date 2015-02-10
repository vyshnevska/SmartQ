Rails.application.routes.draw do
  root 'quizzs#index'

  resources :categories
  resources :quizzs do
    resources :questions do
      resources :answers
    end

    member do
      get :add_question
      post :save_question
      get :complete
    end
  end

  devise_for :users
  resources :users
end
