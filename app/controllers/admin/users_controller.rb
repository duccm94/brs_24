class Admin::UsersController < ApplicationController
  before_action :require_admin

  def index
    @users = User.paginate page: params[:page]
  end

  def destroy
    User.find_by_id(params[:id]).destroy
    flash[:success] = t :destroysuccess
    redirect_to admin_users_path
  end
end
