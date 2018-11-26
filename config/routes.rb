require 'api_constraints'
Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get 'user_challenges_status/show'
      get 'user_challenges_status/create'
      get 'user_challenges_status/update'
    end
  end
  namespace :api do
    namespace :v1 do
      get 'user_challenge/show'
      get 'user_challenge/create'
      get 'user_challenge/update'
    end
  end
  namespace :api do
    namespace :v1 do
      get 'challenges/get'
      get 'challenges/set'
      get 'challenges/update'
      get 'challenges/delete'
    end
  end
  namespace :api, defaults: {format: :json}, path: 'api' do
    namespace :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      devise_for :users, controllers: {
          registrations: 'api/v1/users/registrations',
      }, skip: [:sessions, :password]
    end
  end

  get 'doorkeeper_client_authorization_controller/access_oauth_client_apps'
  use_doorkeeper do
    # No need to register client application
    skip_controllers :applications, :authorized_applications
  end
  resources :samples do
  end


end
