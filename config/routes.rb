Rails.application.routes.draw do
  get 'project_jobs/Postulants'


  root to: 'pages#home'

  devise_for :users, controllers: { registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  # , controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [ :edit, :update, :show ]

  resources :projects , only: [:new, :create,:show, :edit, :delete, :index] do
    resources :project_jobs , only: [:show, :create, :delete, :index] do
      resources :postulants , only: [:show, :delete, :index, :create]
    end
  end



end


