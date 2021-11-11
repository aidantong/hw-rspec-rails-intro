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
      Faraday.get(string)
      # build url
      # faraday api call
      # filter out moves that we already have
      # return movies
    end
  

end
  