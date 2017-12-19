Rails.application.routes.draw do
  get '/', to: 'submit#new'
  # to displat a specific one
  get '/message/:id', to: 'message#show'
  post '/submit/', to: 'submit#create'
  post '/notes/api/', to: 'submit#create'

  # rsa homework:
  # should generate
  post '/rsas/', to: 'rsa#new'
  # get '/rsas/', to: 'rsa#create'
  get '/rsas/:id', to: 'rsa#show'

  post '/rsas/:id/encrypt_messages/', to: 'encrypt#create'
  get '/rsas/:id/encrypt_messages/:msg_id', to: 'encrypt#show'
  post '/rsas/:id/decrypt_messages/', to: 'decrypt#create'
  get '/rsas/:id/decrypt_messages/:msg_id', to: 'decrypt#show'
end
