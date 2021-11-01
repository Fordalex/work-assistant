class CategoriesController < ApplicationController
  before_action :set_category, only: %i[destroy]

  def create
    category = Category.new(category_params.merge(user: current_user))
    if category.save
      flash[:success] = "#{category.name} was added to your categories"
    else
      flash[:warning] = "An error occured please try again"
    end
    redirect_to cms_path
  end

  def destroy
    if @category.destroy
      flash[:success] = "Category destroyed"
    end
    redirect_to cms_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:colour, :name)
  end
end
