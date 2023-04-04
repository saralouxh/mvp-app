module Api
  module V1
    # Handles endpoints related to users
    class MoviesController < Api::V1::ApplicationController
      skip_before_action :authenticate, only: %i[index show]

      # POST /api/v1/movies
      def create
        result = BaseApi::Movies.new_movie(params)
        render_error(errors: "There was a problem creating a new movie", status: 400) and return unless result.success?
        payload = {
          user: MovieBlueprint.render_as_hash(result.payload),
        }
        render_success(payload: payload, status: 201)
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
    end
  end
end
