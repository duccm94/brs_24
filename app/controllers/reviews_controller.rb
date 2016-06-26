class ReviewsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @review = current_user.reviews.build review_params
    @book = Book.find_by_id @review.book_id
    @comment = Comment.new
    if @review.save
      make_rating @book if @review.rate.present?
      respond_to do |format|
        format.html {redirect_to root_url}
        format.js
      end
    else
      flash.now[:danger] = @review.errors.full_messages
      respond_to do |format|
        format.html {redirect_to root_url}
        format.js
      end
    end
  end

  def destroy
    @review = current_user.reviews.find_by_id params[:id]
    @book = @review.book
    @review.destroy
    make_rating @book if @review.rate.present?
    respond_to do |format|
      format.html {redirect_to root_url}
      format.js
    end
  end

  private
  def review_params
    params.require(:review).permit :content, :book_id, :rate
  end

  def make_rating book
    rating = book.reviews.where.not(rate: nil).average(:rate)
    book.update_attributes rating: rating
  end
end
