class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params) #title: params[:title], text: params[:text]
    @post.author_id = current_user.id
    if @post.valid?
      @post.save
      flash[:notice] = 'Post created'
    else
      flash[:notice] = 'Could not create post'
    end
    redirect_to user_path(current_user.id)
  end

  private

  def post_params
    params.permit(:title, :text)
  end
end
