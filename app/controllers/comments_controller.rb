class CommentsController < ApplicationController
  load_and_authorize_resource
  
  def new
    @post = Post.includes(:comments).find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.includes(:comments).find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to user_post_path(current_user, @post)
    else
      render :new
    end
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
