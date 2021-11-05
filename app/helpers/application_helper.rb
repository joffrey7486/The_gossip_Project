module ApplicationHelper
  # Permet d'appeler current_user au lieu de répéter --> User.find_by(id: session[:user_id])
  def current_user
    if session[:user_id]
      current_user = User.find_by(id: session[:user_id])
    elsif cookies[:user_id]  # nous allons vérifier s'il y a bien un cookie contenant l'id de notre utilisateur
      user = User.find_by(id: cookies[:user_id]) # nous allons trouver l'utilisateur en DB à partir du cookie qui stocke le user_id
      puts '#'*100
      puts "Le user remember digest est #{user.remember_digest}"
      puts "Le cookie remember token est #{cookies[:remember_token]}"
      if user && BCrypt::Password.new(user.remember_digest).is_password?(cookies[:remember_token])
        log_in user
        current_user = user
      end
    end
  end

  # servira à connecter facilement l'utilisateur. Ça permet de l'appeler à la page login mais aussi juste après la création d'un nouvel utilisateur (par exemple).
  def log_in(user)
      session[:user_id] = user.id
  end

  def logged_in?
      current_user
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

  def has_liked?(gossip)
    !Like.find_by(user_id: current_user.id, gossip_id: gossip.id).nil?
  end

end


