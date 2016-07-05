Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  #get 'posts' => 'posts#index'
  #get 'posts/:id' => 'posts#show'
    root 'posts#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get '/register', to: 'users#new'
   get '/login', to: 'sessions#new'
   post '/login', to: 'sessions#create'
   get '/logout', to: 'sessions#destroy'
  resources :posts
  resources :users, only: [ :create, :show]
  resources :categories, only: [:index, :new, :create,:destroy,:update,:edit]

  resources :posts do 
    resources :comments 
  end

  resources :posts, except: [:destroy] do
    member do # 客製化連結
      post :vote
      # 這樣會產出 posts/1/vote
    end
    resources :comments, only: [:create, :show,:new] do
      member do
        post :vote
        # 產出 posts/1/comments/1/vote
      end
    end
  end

end



