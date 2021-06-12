Rails.application.routes.draw do
  resources :todos
  resources :projects
	root 'welcome#index'
	get "/projects", to: "projects#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
