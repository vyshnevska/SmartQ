Rails.application.routes.draw do
  resources :user_assessments

  root 'user_assessments#index'

  namespace :admin do
    root 'categories#index'
    resources :categories
    resources :quizzs, :only => [:index, :new, :create, :edit, :update, :destroy] do
      resources :questions

      member do
        get :add_question
        post :save_question
        get :complete
      end
    end

    resources :questions, :only => [ :new, :create ] do
      resources :answers, :only => [ :new ]
    end
  end
  namespace :api do
    resources :users, :user_assessments
  end

  resources :quizzs, :only => [:index]
  resources :user_assessments, :only => [ :index, :new, :update ]
  devise_for :users, :controllers => { :sessions => "custom_sessions", :registrations => "custom_registrations" }
  resources :users do
    member do
      get :switch_to
    end
  end

  # Always redirect to root when unknown route
  get '*path' => redirect('/')
end
