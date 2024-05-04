class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(name: params[:name])
    @videos = @category.videos if @category

  end
end
