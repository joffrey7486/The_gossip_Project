module ApplicationHelper
  # Permet d'appeler current_user au lieu de répéter --> User.find_by(id: session[:user_id])
  def current_user
      User.find_by(id: session[:user_id])
  end

  # servira à connecter facilement l'utilisateur. Ça permet de l'appeler à la page login mais aussi juste après la création d'un nouvel utilisateur (par exemple).
  def log_in(user)
      session[:user_id] = user.id
  end

  def logged_in?
      session[:user_id]
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

  def good_user
    @gossip = Gossip.find(params[:id])
    @user = User.find(@gossip.user_id)
    unless current_user == @user
        flash[:danger] = "It is not your account"
        redirect_to gossip_path(@gossip.id)
    end
  end
end


