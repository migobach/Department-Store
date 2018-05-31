Rails.application.routes.draw do
 
  root 'categories#index'

  resources :categories do
    resources :items
  end

  scope 'items/:item_id', as: 'item' do 
    resources :ratings, only: [:new, :create]
  end
end
