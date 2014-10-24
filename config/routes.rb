Rails.application.routes.draw do
  devise_for :users
  root 'artworks#index'

  resources :artworks do
    resources :attachments
  end
  
  resources :galleries
end
