class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(name: params[:name])
    if @category
      @videos = @category.videos
                         .select("videos.*, CAST(videos.view_count AS bigint) * CAST(videos.like_count AS bigint) AS score")
                         .order('score DESC')
                         .limit(5)
    end
  end
end
