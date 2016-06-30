class BooksController < ApplicationController
  def index
    @categories = Category.all
    @books = Book.where nil
    filtering_params(params).each do |key, value|
      @books = @books.public_send key, value if value.present?
    end
    @books = @books.paginate page: params[:page]
  end

  def show
    @book = Book.find_by_id params[:id]
    if @book
      @review = Review.new
      @comment = Comment.new
      @request = current_user.requests.find_by(book_id: @book.id) || Request.new
      @reviews = @book.reviews.order(created_at: :desc).paginate page: params[:page],
        per_page: Settings.sizepage
    else
      flash[:danger] = t :error
      redirect_to books_path
    end
  end

  private
  def filtering_params params
    params.slice :title, :category, :rating, :favorite
  end
end
