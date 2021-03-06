class CategoriesController < ApplicationController
  layout 'admin'
  
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @q = Category.ransack(params[:q])
    @pagy, @categories = pagy(@q.result(distinct: true))
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to category_path
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end