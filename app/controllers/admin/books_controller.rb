class Admin::BooksController < ApplicationController
  before_action :require_admin

  def index
    @books = Book.paginate page: params[:page]
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new book_params
    if @book.save
      flash[:success] = t :success
      redirect_to admin_books_path
    else
      render :new
    end
  end

  private
  def book_params
    params.require(:book).permit :title, :publish_date, :author,
      :number_pages, :picture, :category_id
  end
end
