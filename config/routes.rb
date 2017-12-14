Rails.application.routes.draw do
  get '/', to: 'submit#new'
  # to displat a specific one
  get '/message/:id', to: 'message#show'
  post '/submit/', to: 'submit#create'
  post '/notes/api/', to: 'submit#create'

  # rsa homework:
  # should generate
  post '/rsas/', to: 'rsa#new'
  get '/rsas/', to: 'rsa#create'
  get '/rsas/:id', to: 'rsa#show'

  # store them eventually
  post '/rsas/:id/enc_message/', to: 'encrypt#create'
  post '/rsas/:id/dec_message/', to: 'decrypt#create'
  # get '/rsas/:id/dec_message/:msg_id', to: 'decrypt#show'
end
