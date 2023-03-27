module Comments
    module Operations
      def self.new_comment(params, current_user)
        comment = current_user.comments.new(content: params[:content], movie_id: params[:movie_id])
        
        return ServiceContract.success(comment) if comment.save

        ServiceContract.error(comment.errors.full_messages)
      end

      def self.update_comment(params, current_user)
        comment = Comment.find(params[:id])
        
        return ServiceContract.success(comment) if comment.update(content: params[:content], movie_id: params[:movie_id])

        ServiceContract.error(comment.errors.full_messages)
      end
    end
  end
  