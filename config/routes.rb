Rails.application.routes.draw do
  get "/search", to: "songs#search"
  get "/songs/named/:name", to: "songs#search_two"
  resources :songs do
    resources :reviews, only: [:new, :create]
  end
  # verb '/path', to: 'controller#action', as: :prefix
  # get '/songs', to: 'songs#index', as: :songs
  # get '/songs/new', to: 'songs#new', as: :new_song
  # get '/songs/:id', to: 'songs#show', as: :song
  # post '/songs', to: 'songs#create' # as: :songs
  # get '/songs/:id/edit', to: 'songs#edit', as: :edit_song
  # patch '/songs/:id', to: 'songs#update' # as: :song
  # delete '/songs/:id', to: 'songs#destroy' # as: :song
end
