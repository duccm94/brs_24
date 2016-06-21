class Admin::UsersController < ApplicationController
  before_action :require_admin
  before_action :find_user, only: [:edit, :update, :destroy]

  def index
    @users = User.paginate page: params[:page]
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t :userupdated
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = t :destroysuccess
    redirect_to admin_users_path
  end

  private
  def user_params
    params.require(:user).permit :name, :email
  end

  def find_user
    @user = User.find_by_id params[:id]
    if @user.nil?
      flash[:danger] = t :findfail
      redirect_to admin_users_path
    end
  end
end
