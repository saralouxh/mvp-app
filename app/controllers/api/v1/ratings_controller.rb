module Api
    module V1
      class RatingsController < Api::V1::ApplicationController
        skip_before_action :authenticate, only: %i[index show]
  
        def create
          result = Ratings::Operations.new_rating(params, @current_user)

          render_error(errors: result.errors.all, status: 400) and return unless result.success?

          payload = {
            rating: RatingBlueprint.render_as_hash(result.payload),
            status: 201
          }
          
          render_success(payload: payload)
        end
  
        def index
          ratings = Rating.all
          payload = {
            rating: RatingBlueprint.render_as_hash(ratings),
            status: 200,
          }
          render_success(payload: payload)
        end
  
        def show
          rating = Rating.find(params[:id])
          payload = {
            rating: RatingBlueprint.render_as_hash(rating),
            status: 200,
          }
          render_success(payload: payload)
        end

        def update
          result = Ratings::Operations.update_rating(params, @current_user)
          render_error(errors: result.errors.all, status: 400) and return unless result.success?
          payload = {
            rating: RatingBlueprint.render_as_hash(result.payload),
            status: 201
          }
          render_success(payload: payload)
        end

        def destroy 
          rating = Rating.find(params[:id])
          rating.destroy
          render_success(payload: "Your rating was deleted.", status: 200)

        end
      end
    end
  end
  