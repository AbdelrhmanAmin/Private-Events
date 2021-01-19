Rails.application.routes.draw do
  resources :attendees
  resources :events, only: [:new, :create, :show, :index]
  devise_for :users, :controllers => { registrations: 'registrations' }
    devise_scope :user do
    get '/users/sign_in' => 'devise/sessions#new'
    get '/users/sign_in' => 'devise/sessions#create'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users
  root "events#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
