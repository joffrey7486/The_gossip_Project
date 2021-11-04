class CommentsController < ApplicationController
  before_action :authenticate_user
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create!(content: params[:content], gossip: Gossip.find(params[:gossip_id]), user: current_user)
    redirect_to gossip_path(@comment.gossip_id)
  end

  def edit
    @comment = Comment.find(params[:id])
    @gossip = Gossip.find(params[:gossip_id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update!(content: params[:comment][:content], gossip: Gossip.find(params[:gossip_id]), user: @comment.user)
      redirect_to gossip_path(@comment.gossip_id)
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to gossip_path(@comment.gossip_id)
  end

  private
  
  def post_params
    params.require(:comment).permit(:content)
  end
end
