class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.all.paginate page: params[:page]
  end

  def show
    @user = User.find_by_id params[:id]
    @favorite_books = Book.favorite(params[:id]).paginate page: params[:page]
    @read_books = Book.read(params[:id]).paginate page: params[:page]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t :success
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t :profileupdated
      redirect_to @user
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def correct_user
    @user = User.find_by_id params[:id]
    redirect_to root_url unless @user == current_user
  end
end
