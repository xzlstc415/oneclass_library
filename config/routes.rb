Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  post 'users' => 'sign_up#create'
  resources :books, except: %w(new edit destroy)
end
