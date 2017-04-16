Rails.application.routes.draw do
  devise_for :users
  
  root 'artworks#index', as: 'authenticated_root'
  resources :artworks do
    resources :attachments
  end
  resources :galleries

  get 'c/:category_id', to: 'categories#show', as: 'categories'
  get 'c/:category_id/:sub_category_id', to: 'categories#show', as: 'sub_categories'
end
