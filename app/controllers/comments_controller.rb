class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.commenter_id = current_user.id
    if @comment.save
      redirect_to "/#{@comment.commentable_type.downcase.pluralize}/#{@comment.commentable_id}"
    else
      flash.now[:errors] = @comment.errors.full_messages
      redirect_to "/#{@comment.commentable_type.downcase.pluralize}/#{@comment.commentable_id}"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy! if @comment
    redirect_to goals_url
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end
end
