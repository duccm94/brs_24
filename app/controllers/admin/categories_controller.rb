class Admin::CategoriesController < ApplicationController
  before_action :require_admin

  def index
    @categories = Category.paginate page: params[:page]
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t :success
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  private
  def category_params
    params.require(:category).permit :name
  end
end
