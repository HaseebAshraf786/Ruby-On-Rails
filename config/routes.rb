Rails.application.routes.draw do
  get 'skills/index'
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  post "/profiles/:profile_id/posts/:post_id/skills/new" ,to:"skills#create"
  post "/profiles/:profile_id/posts/:id/review",to:"posts#rate"
  post "profiles/:id/closed" ,to: "posts#review"
  get'/profiles/:profile_id/posts/:post_id/applicants/:id' ,to: "applicants#show"
  post "/profiles/:profile_id/posts/new" ,to: 'posts#create'
  get "/search",to: 'posts#index'
  post "/profiles/edit", to: "profiles#login"
  root "profiles#index"
  resources :profiles do
    member do
      get :completed
      get :closed
      post :closed
      get :applicants
      post :applicants
      put :login
      patch :login
      get :hire
     
      post :hire
      
    end
    resources :posts do
      member do
        get :review
        post :review
      end
      resources :skills
      resources :applicants
    end
  end
end
