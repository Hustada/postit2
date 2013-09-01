class CategoriesController < ApplicationController
  before_action :require_admin

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params.require(:category).permit(:name))

    if @category.save
       flash[:notice] = "New category!" 
       redirect_to categories_path
    else
       render :new
    end
  end
end 