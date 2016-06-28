class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    @user = User.find_by_id params[:followed_id]
    if @temp = current_user.following?(@user)
      flash.now[:danger] = t :followed
    else
      current_user.follow @user
      add_activity current_user, Settings.follow_type, @user.id
    end
    respond_to do |format|
      format.html {redirect_to @user}
      format.js
    end
  end

  def destroy
    @relationship = Relationship.find_by_id params[:id]
    if @relationship
      @user = @relationship.followed
      current_user.unfollow @user
      remove_activity current_user, Settings.follow_type, @user.id
    else
      flash.now[:danger] = t :unfollowed
    end
    respond_to do |format|
      format.html {redirect_to @user}
      format.js
    end
  end
end
