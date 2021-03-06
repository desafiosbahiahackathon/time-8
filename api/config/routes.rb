Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope format: true, constraints: { format: 'json' } do
    resource :sessions, only: [:create, :destroy]
    resources :forms, only: [:index, :show, :create, :update, :destroy]
  end
end
