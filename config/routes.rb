Rails.application.routes.draw do
  
  resources :measurements
  get '/dashboard', to: 'home#index'

  resources :attendances, except: [:new, :show] do
    collection do
      get :take
    end
  end
  resources :subscriptions, except: [:show] do
    collection do
      get :expire
    end
    member do
      post :pause
      post :restart
    end
  end

  resources :customers do
    member do
      get :consent_form
    end
  end
  resources :plans, except: [:show]
  root 'sessions#new'

  get    '/signin',   to: 'sessions#new'
  post   '/signin',   to: 'sessions#create'
  delete '/signout',  to: 'sessions#destroy'

  resources :users, except: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
