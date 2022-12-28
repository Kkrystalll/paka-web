Rails.application.routes.draw do

  resource :session, only: [] do
    collection do
      get :new, path: :sign_in
      post :create, path: :sign_in
      delete :destroy, path: :sign_out, as: :sign_out
    end
  end

  namespace :admin, path: ENV.fetch('ADMIN_PATH', 'admin') do
    resources :users
  end
end
