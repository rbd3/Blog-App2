class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @post = Post.includes(:Comments).find(params[:id])
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

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
