Rails.application.routes.draw do

  root 'dashboard#index'

  resources :accounts do
    resources :servers, only: [:index, :new, :edit, :update] do
      get ':instance_id/setting', to: :setting, on: :collection
    end
  end

  get 'dashboard/index'

end
