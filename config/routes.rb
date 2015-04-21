Rails.application.routes.draw do

  root 'dashboard#index'

  resources :accounts do
    resources :servers, only: [:index, :new, :edit, :update] do
      get 'setting', to: :setting
    end
  end

  get 'dashboard/index'

end
