module Ratings
    module Operations
      def self.new_rating(params, current_user)
        rating = current_user.ratings.new(rating: params[:rating], movie_id: params[:movie_id])
        
        return ServiceContract.success(rating) if rating.save

        ServiceContract.error(rating.errors.full_messages)
      end

      def self.update_rating(params, current_user)
        rating = Rating.find(params[:id])
        
        return ServiceContract.success(rating) if rating.update(rating: params[:rating], movie_id: params[:movie_id])

        ServiceContract.error(rating.errors.full_messages)
      end
    end
  end