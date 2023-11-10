class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @post = Post.includes(:comments).find(params[:id])
    @user = User.find(params[:user_id])
    @comments = @post.comments

    @index = (@user.posts.order(:created_at).pluck(:id).index(@post.id) + 1 if @user.posts.include?(@post))
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to user_posts_path(current_user)

    else
      flash[:alert] = 'Something went wrong'
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    post = Post.find(params[:id])

    post.comments.destroy_all
    post.likes.destroy_all
    if post.destroy
      flash[:success] = 'Post deleted successfully'
      redirect_to user_posts_path(@user)
    else
      flash.now[:error] = 'Error: Post could not be deleted'
      redirect_to user_post_path(@user, post)
    end
  end


  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
