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
    @review = Review.new
    @comment = Comment.new
    @reviews = @book.reviews.order(created_at: :desc).paginate page: params[:page],
      per_page: Settings.sizepage
  end

  private
  def filtering_params params
    params.slice :title, :category
  end
end
