Rails.application.routes.draw do
  get 'project_jobs/Postulants'


  root to: 'pages#home'

  devise_for :users, controllers: { registrations: 'users/registrations' }
  # , controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :projects , only: [:new, :create,:show, :edit, :delete, :index] do
    resources :projects_jobs , only: [:show, :delete, :index] do
      resources :postulants , only: [:show, :delete, :index]
    end
  end



end


