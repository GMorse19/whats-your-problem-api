# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins
  resources :problems, except: %i[new edit]
  # RESTful routes
  resources :examples, except: %i[new edit]

  # Custom routes
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out' => 'users#signout'
  patch '/change-password' => 'users#changepw'
  patch '/update-user' => 'users#update'
end
