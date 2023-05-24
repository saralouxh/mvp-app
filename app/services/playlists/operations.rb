module Playlists
    module Operations
        def self.new_playlist(params, current_user)
            playlist = current_user.playlists.new(name: params[:name]) 
            return ServiceContract.success(playlist) if playlist.save
            ServiceContract.error(playlist.errors.full_messages)
        end

        def self.update_playlist(params)
            playlist = Playlist.find(params[:id])
            movies = params[:movies] || [] # Handle empty array case
          
            # Find or create movies based on provided attributes
            movie_objects = movies.map do |movie_attrs|
                Movie.find_or_initialize_by(title: movie_attrs[:title]) do |movie|
                movie.assign_attributes(movie_attrs)
                end
            end

            playlist.movies = movie_objects
            return ServiceContract.success(playlist) if playlist.save
            ServiceContract.error(playlist.errors.full_messages)
        end

        def self.playlist_params(params)
            params.require(:playlist).permit(:name, movies: [:title, :image])
        end
          
    end
end