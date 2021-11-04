class LikesController < ApplicationController

  before_action :authenticate_user, only: [:create, :destroy]

  def create
    @like = Like.create(user: current_user.id, gossip: params[:id])

  end

  def destroy
    @gossip = Gossip.find(params[:id]) # je chope le gossip
    @like = @gossip.likes.find(params[:id]) # ensuite son like
    @like.delete # et je le supprime
  end

end
