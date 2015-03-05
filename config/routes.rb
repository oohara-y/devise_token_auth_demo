Rails.application.routes.draw do

  root 'application#index'
  get "*path.html" => "application#index", :layout => 0
  get "*path" => "application#index"
  # resource :home , controller: :home, only: :show

  devise_for :users

  # token auth routes available at /api/v1/auth
  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end

end
