class UsersController < ApplicationController
  before_action :authenticate_user, except: [:create, :new]

  def new
    @city_options = City.all.map{ |c| [ c.name] }.flatten
  end

  def create
    puts "#"*80
    puts params
    puts '#'*80

    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      age: params[:age],
      description: params[:description],
      city: City.find_by(name: params[:city]),
      avatar_link: Faker::Avatar.image(size: "50x50", set: "set3"),
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if @user.save
      # si ça marche, il redirige vers la page d'index du site
      redirect_to root_path
    else
      render 'new'# sinon, il render la view new (qui est celle sur laquelle on est déjà)
    end
  end

  def show
    @user = User.find(params[:id])
  end


end
