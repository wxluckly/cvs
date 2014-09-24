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
    resources :nodes do
      collection do
        put "move"
      end
    end
    resources :banners
    resources :products
  end

  match "kindeditor_upload", path: "/kindeditor/upload", to: "kindeditor/assets#create", via: "post"
  match "kindeditor_filemanager", path: "/kindeditor/filemanager", to: "kindeditor/assets#list", via: "get"

end
