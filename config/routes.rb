Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, format: :json do
    namespace :v1 do
      resources :users, only: [] do
        collection do
          get :request_token
        end
      end
    end
  end
end
