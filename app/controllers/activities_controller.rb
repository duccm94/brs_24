class ActivitiesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @activity = current_user.activities.build activity_params
    if @activity.save
      respond_to do |format|
        format.html {redirect_to root_url}
        format.js
      end
    else
      flash.now[:danger] = @activity.errors.full_messages
      respond_to do |format|
        format.html {redirect_to root_url}
        format.js
      end
    end
  end

  def destroy
    @activity = Activity.find_by_id params[:id]
    if @activity
      @activity.destroy
    else
      flash.now[:danger] = t :notactivity
    end
    respond_to do |format|
      format.html {redirect_to root_url}
      format.js
    end
  end

  private
  def activity_params
    params.require(:activity).permit :action_type, :target_id
  end
end
