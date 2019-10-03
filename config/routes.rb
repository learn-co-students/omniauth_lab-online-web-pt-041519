Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'auth/facebook/callback', to: 'sessions#create'
  get '/', to: 'welcome#home'
end
