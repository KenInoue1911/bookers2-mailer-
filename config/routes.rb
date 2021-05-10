Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "users/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => "homes#top"
  get "home/about" => "homes#about"
  get "/search", to: "searchs#search"


  post "follow/:id" => "relationships#follow", as: "follow"
  post "unfollow/:id" => "relationships#unfollow", as: "unfollow"

  resources :books, only: [:index, :show, :edit, :create, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update] do
    member do
    get :following, :follower
    end
 end
end
