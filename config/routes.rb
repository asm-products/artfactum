Rails.application.routes.draw do
  devise_for :users,
             controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    delete '/users/sign_out' => 'devise/sessions#destroy',
           as: :destroy_user_session
  end
  authenticated :user do
    root to: 'feed#index', as: 'authenticated_root'
  end
end
