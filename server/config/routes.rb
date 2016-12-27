Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Enforce .json format on all API routes. E.g. GET /api/version.json
  namespace :api, format: true, constraints: { format: 'json' } do
    get 'version' => 'api#version', as: :version
    post 'ping' => 'api#ping', as: :ping
  end
end
