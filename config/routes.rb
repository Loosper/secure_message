Rails.application.routes.draw do
  get 'submit/create'

  get 'submit/show'

  get 'submit/new'

  get '/', to: 'submit#new'
  # to displat a specific one
  get '/submit/:id', to: 'submit#show'
  post '/submit/', to: 'submit#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
