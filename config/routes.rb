Rails.application.routes.draw do
  root 'welcome#index'

  resources :nodes do
    collection do
      get 'whats_news'
    end
  end
 
end
