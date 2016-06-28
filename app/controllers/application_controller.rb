class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include ActivitiesHelper

  private
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t :pleaselogin
      redirect_to login_url
    end
  end

  def require_admin
    if logged_in_user
      redirect_to root_path unless current_user.is_admin?
    end
  end

  def activity_params
    params.require(:activity).permit :action_type, :target_id
  end
end
