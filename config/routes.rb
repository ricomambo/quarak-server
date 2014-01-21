Quarak::Application.routes.draw do
  
  scope :api do 
    resources :expenses do
      resources :members
    end

    resources :members do
      resources :expenses
      resources :payments
    end
  end
  
end
