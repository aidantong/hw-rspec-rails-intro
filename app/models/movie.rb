class Movie < ActiveRecord::Base
    def self.all_ratings
      ['G', 'PG', 'PG-13', 'R']
    end
    
    def self.with_ratings(ratings, sort_by)
      if ratings.nil?
        all.order sort_by
      else
        where(rating: ratings.map(&:upcase)).order sort_by
      end
    end
   
    def self.find_in_tmdb(search_params,  apikey='0a2500a4a29abadbc52379b3868083b8')
      uri = 'https://api.themoviedb.org/3/search/movie?'
      uri += 'api_key=' + apikey
      uri += '&query=' + search_params[:title]
      uri += '&language=' + search_params[:language]
      if search_params.key?(:release_year)
        uri += '&year' + search_params[:release_year].to_s
      end 
      json_res = JSON.parse(Faraday.get(URI::escape(uri)).body)
      results = json_res['results']

      movies = []
      if results.length() > 0 
        results.each do |movie|
          new_movie = Movie.new
          new_movie.title = movie['original_title']
          new_movie.rating = 'R'
          new_movie.description = movie['overview']
          new_movie.release_date = movie['release_date']
          
          movies.append(new_movie)
        end
      end
      return movies
        
      # build url
      # faraday api call
      # filter out moves that we already have
      # return movies
    end
  

end
  
#        t.string   "title"
#     t.string   "rating"
#     t.text     "description"
#     t.datetime "release_date"
#     t.datetime "created_at"
#     t.datetime "updated_at"