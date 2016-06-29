class LikesController < ApplicationController
  before_action :logged_in_user

  def create
    @like = current_user.likes.build like_params
    unless @like.save
      flash.now[:danger] = @like.errors.full_messages
    end
    respond_to do |format|
      format.html {redirect_to root_url}
      format.js
    end
  end

  def destroy
    @like = current_user.likes.find_by_id params[:id]
    @like.destroy
    respond_to do |format|
      format.html {redirect_to root_url}
      format.js
    end
  end

  private
  def like_params
    params.require(:like).permit :activity_id
  end
end
