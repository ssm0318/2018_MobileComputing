Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }

 namespace 'api' do
    namespace 'v1' do
      resources :events
      patch '/users/profile/:id/edit' => 'profiles#update', as: :profile_update
      get '/search' => 'events#search', as: :search, defaults: { format: :csv }
    end
  end
end
