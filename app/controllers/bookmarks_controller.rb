class BookmarksController < ApplicationController
  before_action :set_bookmark, only: :destroy
  before_action :set_list, only: [:new, :create]

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
    @movies = Movie.all
    @bookmark.user = current_user
    authorize @bookmark
  end


  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    @bookmark.user = current_user
    authorize @bookmark
    if @bookmark.save
      redirect_to list_path(@list), notice: 'Bookmark was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    authorize @bookmark
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
