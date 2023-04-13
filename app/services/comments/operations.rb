module Comments
    module Operations
      def self.new_comment(params, current_user)
        commentable_type = params[:commentable_type]
        commentable_id = params[:commentable_id]

        if commentable_type.present? && commentable_id.present?
          commentable = commentable_type.constantize.find_by(id: commentable_id)
          
          if commentable.present?
            comment = current_user.comments.new(content: params[:content], commentable: commentable)
            return ServiceContract.success(comment) if comment.save
          else
            ServiceContract.error("Could not find associated object for comment.")
          end
        else
          ServiceContract.error("Commentable type and id are required.")
        end
        
        # commentable = commentable_type.constantize.find(commentable_id)
        # comment = current_user.comments.new(content: params[:content], commentable: commentable)

        # if commentable_type.present? && commentable_id.present?
        
        #   return ServiceContract.success(comment) if comment.save
        # else
        #   ServiceContract.error(comment.errors.full_messages)
        # end

      end

      # # # Need to update this method # # #
      def self.update_comment(params, current_user)
        comment = Comment.find(params[:id])
        commentable = params[:commentable_type].constantize.find(params[:commentable_id])
        
        return ServiceContract.success(comment) if comment.update(content: params[:content], commentable: commentable, user: current_user)

        ServiceContract.error(comment.errors.full_messages)
      end
    end
  end
  