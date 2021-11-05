class LikesController < ApplicationController

  before_action :authenticate_user, only: [:create, :destroy]

  def create
    @like = Like.create(user_id: current_user.id, gossip_id: params[:gossip_id])
    redirect_to :root
  end

  def destroy
    gossip = Gossip.find(params[:gossip_id]) # je chope le gossip
    @like = gossip.likes.find_by(user_id: params[:id]) # ensuite son like
    @like.delete # et je le supprime
    redirect_to :root
  end

end




