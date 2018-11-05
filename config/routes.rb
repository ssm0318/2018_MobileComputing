Rails.application.routes.draw do
 devise_for :users, defaults: { format: :json }

 namespace 'api' do
    namespace 'v1' do
      resources :events
    end
  end
end
