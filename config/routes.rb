require 'api_constraints'
Rails.application.routes.draw do
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
