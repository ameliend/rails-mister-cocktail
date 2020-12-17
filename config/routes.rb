Rails.application.routes.draw do
  get 'reviews/index'
  get 'reviews/create'
  get 'reviews/new'
  get 'reviews/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   root to: 'cocktails#index'
   resources :cocktails, except: :index do
     resources :doses, only: [:index, :new, :create, :destroy]
     resources :reviews, only: [:index, :new, :create, :destroy]
   end
end
