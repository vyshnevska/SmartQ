Rails.application.routes.draw do
  resources :user_assessments

  root 'user_assessments#index'

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
  resources :user_assessments
  devise_for :users
  resources :users

  # Always redirect to root when unknown route
  get '*path' => redirect('/')
end
