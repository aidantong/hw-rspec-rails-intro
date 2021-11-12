Rottenpotatoes::Application.routes.draw do
    resources :movies
    # map '/' to be a redirect to '/movies'
    root :to => redirect('/movies')
    get 'search_tmdb', action: :search_tmdb, controller: 'movies'
    post 'add_movie', action: :add_movie, controller: 'movies'
  end
  