class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @activities = current_user.feed.order(created_at: :desc).paginate page: params[:page]
      @like = Like.new
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
