module Api
  module V1
    # Handles endpoints related to users
    class MoviesController < Api::V1::ApplicationController
      skip_before_action :authenticate, only: %i[index show]

      # POST /api/v1/movies
      def create
        playlist = Playlist.find(params[:playlist_id])
        movie_params = params.require(:movie).permit(:title, :image).except(:id, :runningTimeInMinutes, :titleType, :year, :principals)
        movie = playlist.movies.build(movie_params)
      
        if movie.save
          render json: movie, status: :created
        else
          render json: { error: movie.errors.full_messages.join(', ') }, status: :unprocessable_entity
        end
      end

      def update
        @movie = Movie.find(params[:id])
        if @movie.update(movie_params)
          # Redirect to the playlist update action after updating the movie
          redirect_to update_playlist_path(@movie.playlist_id), notice: 'Movie was successfully updated.'
        else
          render :edit
        end
      end

      # GET /api/v1/movies/
      def index
        movies = Movie.all
        payload = {
          movie: MovieBlueprint.render_as_hash(movies),
          status: 200,
        }
        render_success(payload: payload)
      end

      # GET /api/v1/movies/:id
      def show
        movie = Movie.find(params[:id])
        payload = {
          movie: MovieBlueprint.render_as_hash(movie),
          status: 200,
        }
        render_success(payload: payload)
      end

      def destroy
        playlist = Playlist.find(params[:playlist_id])
        movie = playlist.movies.find(params[:id])
        movie.destroy
        render_success(payload: "Movie Deleted")
      end


      # private

      def movie_params
        params.require(:movie).permit(:title, :image)
      end

    end
  end
end
