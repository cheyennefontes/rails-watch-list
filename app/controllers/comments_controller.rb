class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show destroy edit update]
  skip_before_action :authenticate_user!, only: %i[home index show]

  def index
    skip_policy_scope
    @comments = Comment.all.order("created_at DESC")
  end

  def show
    skip_authorization
  end

  def new
    @bookmark = Bookmark.find(params[:bookmark_id])
    @comment = Comment.new
    authorize @comment
  end

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    @comment = Comment.create(comment_params)
    @comment.bookmark = @bookmark
    @comment.user = current_user
    authorize @comment
    if @comment.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    authorize @comment
    redirect_to bookmark_path(@comment.bookmark), status: :see_other
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
