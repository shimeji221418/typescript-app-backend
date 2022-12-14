Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'posts/index'
      get 'posts/show'
      get 'posts/create'
      get 'posts/update'
      get 'posts/destroy'
      get 'users/index'
      get 'users/show'
      get 'users/update'
      get 'users/destroy'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace 'api' do
    namespace 'v1' do
      resources :users, only: [:index, :show, :update, :destroy]
      resources :posts
      namespace 'auth' do
        post 'registrations' => 'registrations#create'
      end
    end
  end
end
