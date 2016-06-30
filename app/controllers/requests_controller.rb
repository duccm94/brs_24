class RequestsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @request = current_user.requests.build request_params
    unless @request.save
      flash.now[:danger] = @request.errors.full_messages
    end
    respond_to do |format|
      format.html {redirect_to root_url}
      format.js
    end
  end

  def destroy
    @request = current_user.requests.find_by_id params[:id]
    @request.destroy
    respond_to do |format|
      format.html {redirect_to root_url}
      format.js
    end
  end

  def index
    @requests = current_user.requests.paginate page: params[:page]
  end

  private
  def request_params
    params.require(:request).permit :book_id, :request_status
  end
end
