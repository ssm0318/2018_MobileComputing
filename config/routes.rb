Rails.application.routes.draw do
 #devise_for :users, defaults: { format: :json }

 namespace 'api' do
    namespace 'v1' do
      resources :events
      patch '/users/profile/:id/edit' => 'api/v1/profiles#update'
    end
  end
end
