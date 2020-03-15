Rails.application.routes.draw do

  get 'welcome/index'
  root 'welcome#index'
  devise_for :users

  #Resources
  resources :purchase_lists do
      resources :purchase_list_items
  end

  resources :products
  resources :context
end
