class Admin::RequestsController < ApplicationController
  before_action :require_admin
  before_action :find_request, only: [:update, :destroy]

  def index
    @requests = Request.paginate page: params[:page]
  end

  def update
    if @request.update_attributes request_params
      flash[:success] = t :success
      respond_to do |format|
        format.html {redirect_to root_url}
        format.js
      end
    else
      redirect_to admin_requests_path
    end
  end

  def destroy
    @request.destroy
    flash[:success] = t :destroysuccess
    redirect_to admin_requests_path
  end

  private
  def request_params
    params.require(:request).permit :request_status
  end

  def find_request
    @request = Request.find_by_id params[:id]
    if @request.nil?
      flash[:danger] = t :findfail
      redirect_to admin_requests_path
    end
  end
end
