Rails.application.routes.draw do
  get 'pages/home'

  root to: "pages#home"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
