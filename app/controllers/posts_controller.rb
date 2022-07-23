class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
  end

  def create
    @post = Post.new(post_params)
    if @post.valid?
      @post.save
      flash[:notice] = 'Post created'
    else
      flash[:notice] = 'Could not create post'
    end
    redirect_to user_post_path(@current_user.id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
