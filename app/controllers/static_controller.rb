class StaticController < ApplicationController
  def home
    @all_gossips = Gossip.all
    
  end

  def team
  end

  def contact
  end
end
