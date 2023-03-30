class ListsController < ApplicationController
  before_action :set_list, only: %i[show destroy edit update]
  skip_before_action :authenticate_user!, only: %i[home index show]

  def index
    skip_policy_scope
    if params[:query].present?
      @lists = List.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @lists = List.all.order("created_at DESC")
    end
    respond_to do |format|
      if turbo_frame_request?
        format.html { render partial: 'lists/lists', locals: { lists: @lists } }
      else
        format.html
      end
    end
  end

  def show
    skip_authorization
  end

  def new
    @list = List.new
    @bookmark = Bookmark.new
    @list.user = current_user
    authorize @list
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    authorize @list
    if @list.save
      redirect_to list_path(@list), notice: 'Lista criada com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @list
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
