module Ratings
    module Operations
      def self.new_rating(params, current_user)
        rated_on = params[:rated_on_type].constantize.find(params[:rated_on_id])
        rating = current_user.ratings.new(rating: params[:rating], rated_on: rated_on)
        
        return ServiceContract.success(rating) if rating.save

        ServiceContract.error(rating.errors.full_messages)
      end

      def self.update_rating(params, current_user)
        rating = Rating.find(params[:id])
        rated_on = params[:rated_on_type].constantize.find(params[:rated_on_id])
        
        return ServiceContract.success(rating) if rating.update(rating: params[:rating], rated_on: rated_on, user: current_user)

        ServiceContract.error(rating.errors.full_messages)
      end
    end
  end