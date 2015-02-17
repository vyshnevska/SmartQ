Rails.application.routes.draw do
  root 'quizzs#index'

  namespace :admin do
    root 'categories#index'
    # root 'quizzs#index'
    resources :categories
    resources :quizzs, only: [:index, :new, :create, :edit, :update, :destroy] do
      resources :questions do
        resources :answers
      end

      member do
        get :add_question
        post :save_question
        get :complete
      end
    end
  end

  resources :quizzs, only: [:index]
  devise_for :users
  resources :users
end
