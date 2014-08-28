Rails.application.routes.draw do
  devise_for :staffers
  root 'welcome#index'

  resources :nodes do
    collection do
      get 'whats_news'
    end
    member do
      get 'show_list_triple'
      get 'show_list_single'
    end
  end
  
  namespace :admin do 
    root 'home#index'
    resources :nodes
  end

end
