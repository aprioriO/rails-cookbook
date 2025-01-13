class BookmarksController < ApplicationController
  before_action :set_bookmark, only: :destroy
  before_action :set_category, only: [:new, :create]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.category = @category
    if @bookmark.save
      redirect_to category_path(@category)
    else
      @recipe = Recipe.new
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to category_path(@bookmark.category), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end
end
