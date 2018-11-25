Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }

 namespace 'api' do
    namespace 'v1' do
      resources :events
      get '/profiles' => 'profiles#index'
      get '/profiles/:id' => 'profiles#show'
      patch '/profiles/:id/edit' => 'profiles#update', as: :profile_update
      get '/events/search' => 'events#search', as: :search, defaults: { format: :csv }
      # get '/profiles/search' => 'profiles#search', as: :search, defaults: { format: :csv }
    end
  end
end
