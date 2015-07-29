class Api::Users::CommentsController < Api::Users::ApplicationController
  def create
    @comment = CommentForm.new_with_model
    @comment.submit params[:comment]
    if @comment.save
      render json: { id: @comment.id,
                     login: @comment.user.login,
                     body: @comment.body
      }
    else
      head :bad_request
    end
  end

  def update
    @comment = CommentForm.find_with_model params[:id]
    if @comment.user_id == current_user.id || current_user.role.admin?
      @comment.submit params[:comment]
      if @comment.save
        render json: { id: @comment.id,
                       login: @comment.user.login,
                       body: @comment.body
        }
      else
        head :bad_request
      end
    else
      head :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    if @comment.user_id == current_user.id || current_user.role.admin?
      @comment.destroy
      head :ok
    else
      head :unprocessable_entity
    end
  end
end
