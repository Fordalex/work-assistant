class CategoriesController < ApplicationController
  def create
    category = Category.new(category_params.merge(user: current_user))
    if category.save
      flash[:success] = "#{category.name} was added to your categories"
    else
      flash[:warning] = "An error occured please try again"
    end
    redirect_to cms_path
  end

  private

  def category_params
    params.require(:category).permit(:colour, :name)
  end
end
