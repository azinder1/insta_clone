Rails.application.routes.draw do
  get '/' => 'home#index'
  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out

  get '/create-comment' => "photos#newComment"
  post '/create-comment' => "comments#createComment"


  resources :users do
    resources :photos
  end

  resources :photos, only: [:index] do
    get '/like', :to => "photos#like"
    resources :comments
  end
end
