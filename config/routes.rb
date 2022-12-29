Rails.application.routes.draw do
  root 'admin/sessions#new'
  namespace :admin, path: ENV.fetch('ADMIN_PATH', 'admin') do
    resources :users

    resource :session, only: [] do
      collection do
        get :new, path: :sign_in
        post :create, path: :sign_in
        delete :destroy, path: :sign_out, as: :sign_out
      end
    end
  end
end
