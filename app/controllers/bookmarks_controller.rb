class BookmarksController < ApplicationController
  before_action :set_category, only: [:new, :create]
  before_action :set_bookmark, only: :destroy

  def new
    # @category = Category.find(params[:category_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    # @category = Category.find(params[:category_id])
    @bookmark.category = @category
    if @bookmark.save
      redirect_to category_path(@category)
    else
      # @recipe = Recipe.new
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to category_path(@bookmark.category), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :recipe_id)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end
end
