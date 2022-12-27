class RepliesController < ApplicationController
  before_action :set_reply, only: %i[show destroy edit update]
  skip_before_action :authenticate_user!, only: %i[home index show]

  def index
    skip_policy_scope
    @replies = Reply.all.order("created_at DESC")
  end

  def show
    skip_authorization
  end

  def create
    @list = List.find(params[:list_id])
    @comment = Comment.find(params[:comment_id])
    @reply = Reply.new(reply_params)
    @reply.reply = @reply
    @reply.user = current_user
    authorize @reply
    if @reply.save
      redirect_to list_path(@list)
    else
      redirect_to list_path(@list), status: :unprocessable_entity, notice: "resposta não pode estar em branco"
    end
  end

  def edit
    @reply = reply.find(params[:id])
    authorize @reply
  end

  def update
    @reply = reply.find(params[:id])
    authorize @reply
    if @reply.update(reply_params)
      redirect_to @reply, notice: "resposta atualizada com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @reply = reply.find(params[:id])
    @reply.destroy
    authorize @reply
    redirect_to reply_path(@reply.reply), status: :see_other
  end

  private

  def set_reply
    @comment = Comment.find(params[:id])
  end

  def reply_params
    params.require(:reply).permit(:content)
  end
end
