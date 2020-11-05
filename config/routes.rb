Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users

  resources :users, only: [:show] do
    resources :job_applications do
      resources :job_informations
    end
  end
end
