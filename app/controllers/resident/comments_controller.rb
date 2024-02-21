class Resident::CommentsController < ApplicationController
    class Resident::CommentsController < ApplicationController
        def create
          @comment = current_user.comments.new(comment_params)
      
          if @comment.save
            flash[:notice] = "Comment added successfully."
          elsif !@comment.save
            flash[:alert] = @comment.errors.full_messages.to_sentence
          end
          redirect_back(fallback_location: root_path)
        end
      
        def destroy
          @comment = current_user.comments.find(params[:id])
          @comment.destroy
          flash[:notice] = "Comment deleted successfully."
          redirect_back(fallback_location: root_path)
        rescue ActiveRecord::RecordNotFound
          flash[:alert] = "Comment not found."
          redirect_back(fallback_location: root_path)
        end
      
        private
      
        def comment_params
          params
          .require(:comment)
          .permit(:content)
          .merge(post_id: params[:post_id])
        end
      end
      
      
end
