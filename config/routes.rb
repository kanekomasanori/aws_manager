Rails.application.routes.draw do
  resources :accounts

  root 'servers#index'
  resources :servers, only: [:index, :new, :edit, :update] do
    get 'setting/:instance_id', to: :setting, on: :collection
  end

end
