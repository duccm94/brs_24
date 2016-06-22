class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  
  def create
    @comment = current_user.comments.build comment_params
    if @comment.save
      respond_to do |format|
        format.html {redirect_to root_url}
        format.js
      end
    else
      flash[:alert] = t :error
      redirect_to :back
    end
  end

  def destroy
    @comment = Comment.find_by_id params[:id]
    @comment.destroy
    respond_to do |format|
      format.html {redirect_to root_url}
      format.js
    end
  end

  private
  def comment_params
    params.require(:comment).permit :content, :review_id
  end
end
