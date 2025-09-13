Rails.application.routes.draw do

  resources :contacts, only: [:index] do
    member do
      get  :preview_email 
      post :send_email
    end
  end

  # Email templates dashboard
  resources :email_templates do
    member do
      get :preview
    end
  end
end
