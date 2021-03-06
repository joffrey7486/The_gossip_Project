class GossipsController < ApplicationController
  before_action :authenticate_user, except: [:index]
  before_action :good_user, except: [:show, :index, :create, :new]

  def index
    @all_gossips = Gossip.all
    @user = User.all
  end

  def show
    @gossip = Gossip.find(params[:id])
    @gossip_is_new = true if (Time.now - 10) < @gossip.created_at
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(
      title: params[:title], 
      content: params[:content], 
      user: current_user)
    if @gossip.save # essaie de sauvegarder en base @gossip
      # si ça marche, il redirige vers la page d'index du site
      @gossip_is_valid = true
      redirect_to gossip_path(@gossip.id)
    else
      @gossip_is_valid = false
      flash[:success] = "Potin bien créé !"
      render 'new'# sinon, il render la view new (qui est celle sur laquelle on est déjà)
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(gossip_params)
      redirect_to gossip_path(@gossip.id)
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end

  private 


  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end

end
