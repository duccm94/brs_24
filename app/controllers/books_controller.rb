class BooksController < ApplicationController
  def index
    @books = Book.order(rating: :desc).paginate page: params[:page]
  end

  def show
    @book = Book.find_by_id params[:id]
    @review = Review.new
    @comment = Comment.new
    @reviews = @book.reviews.order(created_at: :desc).paginate page: params[:page],
      per_page: Settings.sizepage
  end
end
