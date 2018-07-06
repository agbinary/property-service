Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'properties/nearby', to: 'properties#nearby', as: :nearby
    end
  end
end
