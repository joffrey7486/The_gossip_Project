class StaticController < ApplicationController
  def home
    @all_gossips = Gossip.all
  end

  def team
  end

  def contact
  end

  def client_show
    @client = params[:client]
  end

  def gossip_show
    @gossip = Gossip.find_by(id: params[:id])
  end

  def user_show
    @user = User.find_by(id: params[:id])
  end
end
