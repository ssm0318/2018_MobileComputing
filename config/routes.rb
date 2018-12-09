Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'visitor#main'
  get 'register/info'
  get 'visitor/main'
  post 'register/infoget'

  devise_for :users, :controllers => { omniauth_callbacks: 'user/omniauth_callbacks', registrations: "user/registrations", sessions: 'user/sessions' }

  namespace 'api' do
    namespace 'v1' do
      # events
      resources :events
      get '/events/search/:keyword/' => 'events#search'
      get '/events/request/:event_id/:requester_id/' => 'events#event_request'
      get '/events/accept/:event_id/:user_id/' => 'events#accept_event_request'
      get '/events/bookmark/:user_id/:event_id/' => 'events#bookmark'
      
      # profiles
      get '/profiles' => 'profiles#index'
      get '/profiles/:id/' => 'profiles#show'
      patch '/profiles/:id/edit' => 'profiles#update', as: :profile_update
      post '/profiles/:id/reviews' => 'profiles#review'
      get '/profiles/follow/:follower_id/:following_id' => 'profiles#follow'
      post '/profiles/match/:id/' => 'profiles#match'
    end
  end
end
