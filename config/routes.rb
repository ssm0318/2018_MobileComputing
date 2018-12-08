Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'visitor#main'
  get 'register/info'
  get 'visitor/main'
  post 'register/infoget'

  devise_for :users, :controllers => { omniauth_callbacks: 'user/omniauth_callbacks', registrations: "user/registrations", sessions: 'user/sessions' }

  namespace 'api' do
    namespace 'v1' do
      resources :events
      get '/profiles' => 'profiles#index'
      get '/profiles/:id' => 'profiles#show'
      patch '/profiles/:id/edit' => 'profiles#update', as: :profile_update
      get '/events/search/:keyword' => 'events#search', as: :search, defaults: { format: :csv }
      get '/events/request/:event_id/:requester_id' => 'events#event_request'
      # get '/profiles/search' => 'profiles#search', as: :search, defaults: { format: :csv }
    end
  end
end
