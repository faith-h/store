Rails.application.routes.draw do
  root 'static_pages#home'
  
  resources :departments do
    resources :pets
  end

  resources :pets do
    resources :comments
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
