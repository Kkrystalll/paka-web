Rails.application.routes.draw do
  root 'sessions#new'

  resources :users
  resources :companies, only: %i[new create]

  resource :session, only: [] do
    collection do
      get :new, path: :sign_in
      post :create, path: :sign_in
      delete :destroy, path: :sign_out, as: :sign_out
    end
  end

  resources :password_resets, only: %i[new create edit update]
end
