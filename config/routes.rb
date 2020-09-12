# frozen_string_literal: true

Rails.application.routes.draw do
  resources :problems, except: %i[new edit]
  # RESTful routes
  resources :examples, except: %i[new edit]
  resources :problems do
    member do
      put 'like', to: 'problems#upvote'
      put 'unlike', to: 'problems#downvote'
      get 'likes', to: 'problems#like'
    end
  end

  # Custom routes
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out' => 'users#signout'
  patch '/change-password' => 'users#changepw'
  patch '/update-user' => 'users#update'
  get '/checkusername' => 'users#checkusername'
  get '/checkemail' => 'users#checkemail'
end
