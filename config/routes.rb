Rails.application.routes.draw do
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
 
end
