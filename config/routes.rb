Rails.application.routes.draw do
  root 'sessions#new'

  resources :users
  resources :companies, only: %i[show new create edit] do
    member do
      get :employee_management
      post :new_employee
    end
  end

  resource :session, only: [] do
    collection do
      get :new, path: :sign_in
      post :create, path: :sign_in
      delete :destroy, path: :sign_out, as: :sign_out
    end
  end

  resources :password_resets, only: %i[new create edit update]
end
