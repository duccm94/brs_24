class ReviewsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  def create
    @review = current_user.reviews.build review_params
    @book = Book.find_by_id @review.book_id
    if @review.save
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
    @review = current_user.reviews.find_by_id params[:id]
    @book = @review.book
    @review.destroy
    respond_to do |format|
      format.html {redirect_to root_url}
      format.js
    end
  end

  private
  def review_params
    params.require(:review).permit :content, :book_id
  end
end
