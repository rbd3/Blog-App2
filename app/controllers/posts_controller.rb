class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @comments = @post.comments

  end

  def new
    @post = Post.new
  end

  def create
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
