class CommentsController < ApplicationController
  before_action :logged_in_user, except: [:new, :show, :index]
  before_action :find_comment, only: [:destroy, :update, :edit]
  
  def create
    @comment = current_user.comments.build comment_params
    if @comment.save
      add_activity "comment", @comment.review.book_id
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
    @comment.destroy
    remove_activity "comment", @comment.review.book_id
    respond_to do |format|
      format.html {redirect_to root_url}
      format.js
    end
  end

  def edit
  end

  def update
    if @comment.update_attributes comment_params
      flash[:success] = t :commentupdated
    else
      render :edit
    end
  end

  private
  def comment_params
    params.require(:comment).permit :content, :review_id
  end

  def find_comment
    @comment = Comment.find_by_id params[:id]
    if @comment.nil?
      flash.now[:danger] = t :error
      redirect_to :back
    end
  end
end
