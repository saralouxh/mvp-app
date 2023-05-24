module BaseApi
  module Movies
    def self.new_movie(params)
      movie = Movie.new(
        image: params[:image],
        title: params[:title],
      )
      begin
        movie.save!
      rescue ActiveRecord::RecordInvalid => exception
        return ServiceContract.error("Error saving movie.") unless movie.valid?
      end

      ServiceContract.success(movie)
    end
  end
end
