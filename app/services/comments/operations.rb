module Comments
    module Operations
      def self.new_comment(params, current_user)
        commentable = params[:commentable_type].constantize.find(params[:commentable_id])
        comment = current_user.comments.new(content: params[:content], commentable: commentable)
        
        return ServiceContract.success(comment) if comment.save

        ServiceContract.error(comment.errors.full_messages)
      end

      def self.update_comment(params, current_user)
        comment = Comment.find(params[:id])
        commentable = params[:commentable_type].constantize.find(params[:commentable_id])
        
        return ServiceContract.success(comment) if comment.update(content: params[:content], commentable: commentable, user: current_user)

        ServiceContract.error(comment.errors.full_messages)
      end
    end
  end
  