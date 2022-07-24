class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params) # title: params[:title], text: params[:text]
    @comment.author_id = current_user.id
    if @comment.valid?
      @comment.save
      flash[:notice] = 'Comment created'
    else
      flash[:notice] = 'Could not create comment'
    end
    redirect_to user_path(current_user.id)
  end

  private

  def comment_params
    params.permit(:text)
  end
end
