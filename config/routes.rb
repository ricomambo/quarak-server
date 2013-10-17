Quarak::Application.routes.draw do
  
  resources :expenses do
    resources :members
  end

  resources :members do
    resources :expenses
    resources :payments
  end

  root 'home#index'
end
