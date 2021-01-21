Rails.application.routes.draw do

  # -------- CRUD'S ---------
  resources :articles
  #   get "/articles" => Index
  #   post "/articles" => Create
  #   delete "/articles" => Delete
  #   get "/articles/:id" => Show
  #   get "/articles/new" => New
  #   get "/articles/:id/edit" => Edit
  #   patch "/articles/:id" => Update
  #   put "/articles/:id" => Update

  root 'welcome#index' # Cambia el index de la pagina
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end