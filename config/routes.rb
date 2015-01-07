Rails.application.routes.draw do
  devise_for :users,
             controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  devise_scope :user do
    delete '/users/sign_out' => 'devise/sessions#destroy',
           as: :destroy_user_session
  end
  
  as :user do
    get 'sign_in' => redirect('/'), as: :new_session
  end
  
  authenticated :user do
    root 'artworks#index', as: 'authenticated_root'
    resources :artworks do
      resources :attachments
    end
    resources :galleries

    get 'c/:category_id', to: 'categories#show', as: 'categories'
    get 'c/:category_id/:sub_category_id', to: 'categories#show', as: 'sub_categories'
  end

  namespace :api do
    resources :users
    resources :artworks
    resources :galleries
  end
end
