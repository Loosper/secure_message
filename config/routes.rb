Rails.application.routes.draw do
  get 'message/show'

  get '/', to: 'submit#new'
  # to displat a specific one
  get '/message/:id', to: 'message#show'
  post '/submit/', to: 'submit#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
