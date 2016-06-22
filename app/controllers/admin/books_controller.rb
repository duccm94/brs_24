class Admin::BooksController < ApplicationController
  before_action :require_admin
  before_action :find_book, only: [:edit, :update, :destroy]

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

  def edit
  end

  def update
    if @book.update_attributes book_params
      flash[:success] = t :bookupdated
      redirect_to admin_books_path
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    flash[:success] = t :destroysuccess
    redirect_to admin_books_path
  end

  private
  def book_params
    params.require(:book).permit :title, :publish_date, :author,
      :number_pages, :picture, :category_id
  end

  def find_book
    @categories = Category.all
    @book = Book.find_by_id params[:id]
    if @book.nil?
      flash[:danger] = t :findfail
      redirect_to admin_books_path
    end
  end
end
