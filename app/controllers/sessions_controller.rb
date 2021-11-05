class SessionsController < ApplicationController
  def new
  end

  def create
    puts params
    # cherche s'il existe un utilisateur en base avec l’e-mail
    user = User.find_by(email: params[:email])
  
    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if user && user.authenticate(params[:password])
      log_in(user)
      # redirige où tu veux, avec un flash ou pas
      remember(user)
      puts "le mail de l'utilisateur est "
      puts "le remember digest a bien été mis en base. C'est : #{user.remember_digest}"
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      puts "Tu es un caca"
      render 'new'
    end
  end
      
  def destroy
    log_out(current_user)
    redirect_to root_path
  end
end
